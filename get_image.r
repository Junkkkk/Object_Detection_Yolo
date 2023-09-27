library(XML)
library(methods)

get_label1 <- function(xmlfile, type){
	    tmp <- xmlToDataFrame(xmlfile, stringsAsFactors=FALSE)

    fn0 <- gsub(".png", "", tmp$text[2])
        fn <- gsub("D:\\\\view", "/data4/Threat_Xray/AI_HUB", tmp$text[3])
        fn <- gsub("\\\\", "/", fn)

	    fn1 <- strsplit(fn, "/")[[1]]
	    if(fn1[6]=="Electronic cigarettes(Liquid)") fn1[6] <- "Electronic cigarettes_Liquid"
	        fn1[6] <- paste0("'",fn1[6],"'")
	        fn <- paste0(fn1, collapse="/")

		    lab_name <- tmp$name
		    width <- as.numeric(tmp$width[5])
		        height <- as.numeric(tmp$height[5])

		        tmp0 <- xmlRoot(xmlParse(xmlfile))

			    targ <- which(!is.na(lab_name))
			    locate_info <- list()
			        for(i in targ){
					        locate_info_tmp <- as.numeric(xmlToDataFrame(tmp0[[i]][["bndbox"]], stringsAsFactors=FALSE)[,1])
			            locate_info[[i]] <- data.frame(t(c(locate_info_tmp, width, height,
								               sum(locate_info_tmp[c(1,3)])/2/width, sum(locate_info_tmp[c(2,4)])/2/height,
									               diff(locate_info_tmp[c(1,3)])/width, diff(locate_info_tmp[c(2,4)])/height
									               )))
				        }

			        class1 <- c('Aerosol', 'Alcohol', 'Awl', 'Axe', 'Bat', 'Battery', 'Bullet', 'Chisel', 'Electronic cigarettes', 'Electronic cigarettes(Liquid)', 'Firecracker', 'Gun', 'GunParts', 'Hammer', 'HandCuffs', 'HDD', 'Knife', 'Laptop', 'Lighter', 'Liquid', 'Match', 'MetalPipe', 'NailClippers', 'Plier', 'PrtableGas', 'Saw', 'Scissors', 'Screwdriver', 'SmartPhone', 'SolidFuel', 'Spanner', 'SSD', 'SupplymentaryBattery', 'TabletPC', 'Thinner', 'Throwing Knife', 'USB', 'ZippoOil')
				    res <- data.frame(lab_name[targ],do.call(rbind, locate_info), stringsAsFactors=FALSE)
				    res[,1] <- factor(res[,1], levels=class1, labels=1:length(class1)-1)
				        
				    #    write.table(res[,c(1,8:11)], paste0("~/yolov7/threat_NIA/labels/",type,"/",fn0,".txt"), row.names=FALSE, col.names=FALSE, quote=FALSE, sep=" ")
				    #    system(paste0("cp ",fn," ~/yolov7/threat_NIA/images/",type,"/",fn0,".png"))
				    #    write.table(paste0("./images/",type,"/",fn0,".png"), paste0("~/yolov7/threat_NIA/",type,".txt"), row.names=FALSE, col.names=FALSE, quote=FALSE, append=TRUE)

				        write.table(res[,c(1,8:11)], paste0("~/yolov7_rect/threat_NIA_total/labels/",type,"/",fn0,".txt"), row.names=FALSE, col.names=FALSE, quote=FALSE, sep=" ")
				        system(paste0("cp ",fn," ~/yolov7_rect/threat_NIA_total/images/",type,"/",fn0,".png"))
					    write.table(paste0("./images/",type,"/",fn0,".png"), paste0("~/yolov7_rect/threat_NIA_total/",type,".txt"), row.names=FALSE, col.names=FALSE, quote=FALSE, append=TRUE)

					    cat(fn0, "...\n", sep="")
					        return(invisible(NULL))
					    #     return(data.frame(lab_name[targ],do.call(rbind, locate_info), stringsAsFactors=FALSE))
}

setwd("/data4/Threat_Xray/AI_HUB/Annotation/Train/Pascal/Smith")
split_info <- sample(0:2, 137671, replace=TRUE, prob=c(10,1,2))
tmp <- lapply(lf[split_info==0], get_label1, type="train")
tmp <- lapply(lf[split_info==1], get_label1, type="val")
tmp <- lapply(lf[split_info==2], get_label1, type="test")
