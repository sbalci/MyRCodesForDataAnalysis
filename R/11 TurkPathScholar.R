library(tidyverse)
library(scholar)

ids <- c(
    'QW5aIMgAAAAJ',
    '7RMSxacAAAAJ',
    'zErZQhLp9RwC',
    '_K9lqwoAAAAJ',
    'tlOCzf0AAAAJ',
    'vQrxiDQAAAAJ',
    'VYE2H0wAAAAJ',
    'uvOBiHcAAAAJ',
    'qB9AdDIAAAAJ',
    '4zrhfwkAAAAJ',
    '607Z4gwAAAAJ',
    '3tePMT0AAAAJ',
    'DW-i4qgAAAAJ',
    'eRUv9ncAAAAJ',
    'yvqiaxAAAAAJ',
    'DFmxZ4cAAAAJ',
    'hsJJzt0AAAAJ',
    'KKsqUTkAAAAJ',
    'hp7lZdUAAAAJ',
    'EPLKOEEAAAAJ',
    'fco45c4AAAAJ',
    'ku0pFmwAAAAJ',
    'XIehk5QAAAAJ',
    'v3Y_5EAAAAAJ',
    'gBIMWX8AAAAJ',
    '5l_WCs4AAAAJ',
    'kp9H1WwAAAAJ',
    '6FKqnZsAAAAJ',
    'qNdLNjoAAAAJ',
    'k505q3oAAAAJ',
    'blULJj0AAAAJ',
    '5ce8ee0AAAAJ',
    'SzTuoS4AAAAJ',
    'IL__PBkAAAAJ',
    '6QqrEM8AAAAJ',
    'WoSwwjEAAAAJ',
    'etLEIQQAAAAJ',
    'eEQstxcAAAAJ',
    'QypLefwAAAAJ',
    'BKw2WSMAAAAJ',
    '4LH0M6IAAAAJ',
    'LdEs3zAAAAAJ',
    'pjRAVkAAAAAJ',
    'cJaAkEIAAAAJ',
    'q40DcqYAAAAJ',
    'iaFxrNQAAAAJ',
    'QZkewskAAAAJ',
    '7U9zfakAAAAJ',
    'qwm9RUEAAAAJ',
    'sKvKv-wAAAAJ',
    'XmjHYI8AAAAJ',
    '02MBtFEAAAAJ',
    'M4S8czQAAAAJ',
    'sRZE1dwAAAAJ',
    'MtrMn5MAAAAJ',
    '7JXDmmsAAAAJ',
    '6WSjZ1gAAAAJ',
    'u9WFGOIAAAAJ',
    'cbw-BrEAAAAJ',
    '2BgnqSkAAAAJ',
    'sfhZMY4AAAAJ',
    'MB2oVvIAAAAJ',
    'fbtuxEkAAAAJ',
    'pKGWPlEAAAAJ',
    'j8F8ef0AAAAJ',
    'zsTGibcAAAAJ',
    'FaXSadMAAAAJ',
    '5F6nB2EAAAAJ',
    'zl6Ka5oAAAAJ',
    '102Cem0AAAAJ',
    'EMDR2L8AAAAJ',
    'HWPeqy4AAAAJ',
    'hdd5Rc0AAAAJ',
    'oQ3N3BEAAAAJ',
    'WAANsz8AAAAJ',
    'azLwpbAAAAAJ',
    'guqKS0sAAAAJ',
    'qu1AUuAAAAAJ',
    'Xlgbbb4AAAAJ',
    'eqL-jw8AAAAJ',
    '8EiFSygAAAAJ',
    'ZqOD3SwAAAAJ',
    'DEgcMswAAAAJ',
    'iJ3CFQwAAAAJ',
    'wiwJxYoAAAAJ',
    'J2Vr2ywAAAAJ',
    'qx1ZsPoAAAAJ',
    'e1SjVlUAAAAJ',
    'joN_UxsAAAAJ',
    'RJNKLHgAAAAJ',
    'g90Ps4AAAAAJ',
    'cdD1lD8AAAAJ',
    'yTmQUOoAAAAJ',
    'pJWINDIAAAAJ',
    'TR2KaW0AAAAJ',
    '50QEh0QAAAAJ',
    'ngMTCjkAAAAJ',
    'PNkFA40AAAAJ',
    'fTIU4ZkAAAAJ',
    'XfDkj2AAAAAJ',
    'iTic-kIAAAAJ'
)







id_QW5aIMgAAAAJ <- get_profile('QW5aIMgAAAAJ')
id_7RMSxacAAAAJ <- get_profile('7RMSxacAAAAJ')
id_zErZQhLp9RwC <- get_profile('zErZQhLp9RwC')
id__K9lqwoAAAAJ <- get_profile('_K9lqwoAAAAJ')
id_tlOCzf0AAAAJ <- get_profile('tlOCzf0AAAAJ')
id_vQrxiDQAAAAJ <- get_profile('vQrxiDQAAAAJ')
id_VYE2H0wAAAAJ <- get_profile('VYE2H0wAAAAJ')
id_uvOBiHcAAAAJ <- get_profile('uvOBiHcAAAAJ')
id_qB9AdDIAAAAJ <- get_profile('qB9AdDIAAAAJ')
id_4zrhfwkAAAAJ <- get_profile('4zrhfwkAAAAJ')
id_607Z4gwAAAAJ <- get_profile('607Z4gwAAAAJ')
id_3tePMT0AAAAJ <- get_profile('3tePMT0AAAAJ')
id_DWi4qgAAAAJ <- get_profile("DW-i4qgAAAAJ")
id_eRUv9ncAAAAJ <- get_profile('eRUv9ncAAAAJ')
id_yvqiaxAAAAAJ <- get_profile('yvqiaxAAAAAJ')
id_DFmxZ4cAAAAJ <- get_profile('DFmxZ4cAAAAJ')
id_hsJJzt0AAAAJ <- get_profile('hsJJzt0AAAAJ')
id_KKsqUTkAAAAJ <- get_profile('KKsqUTkAAAAJ')
id_hp7lZdUAAAAJ <- get_profile('hp7lZdUAAAAJ')
id_EPLKOEEAAAAJ <- get_profile('EPLKOEEAAAAJ')
id_fco45c4AAAAJ <- get_profile('fco45c4AAAAJ')
id_ku0pFmwAAAAJ <- get_profile('ku0pFmwAAAAJ')
id_XIehk5QAAAAJ <- get_profile('XIehk5QAAAAJ')
id_v3Y_5EAAAAAJ <- get_profile('v3Y_5EAAAAAJ')
id_gBIMWX8AAAAJ <- get_profile('gBIMWX8AAAAJ')
id_5l_WCs4AAAAJ <- get_profile('5l_WCs4AAAAJ')
id_kp9H1WwAAAAJ <- get_profile('kp9H1WwAAAAJ')
id_6FKqnZsAAAAJ <- get_profile('6FKqnZsAAAAJ')
id_qNdLNjoAAAAJ <- get_profile('qNdLNjoAAAAJ')
id_k505q3oAAAAJ <- get_profile('k505q3oAAAAJ')
id_blULJj0AAAAJ <- get_profile('blULJj0AAAAJ')
id_5ce8ee0AAAAJ <- get_profile('5ce8ee0AAAAJ')
id_SzTuoS4AAAAJ <- get_profile('SzTuoS4AAAAJ')
id_IL__PBkAAAAJ <- get_profile('IL__PBkAAAAJ')
id_6QqrEM8AAAAJ <- get_profile('6QqrEM8AAAAJ')
id_WoSwwjEAAAAJ <- get_profile('WoSwwjEAAAAJ')
id_etLEIQQAAAAJ <- get_profile('etLEIQQAAAAJ')
id_eEQstxcAAAAJ <- get_profile('eEQstxcAAAAJ')
id_QypLefwAAAAJ <- get_profile('QypLefwAAAAJ')
id_BKw2WSMAAAAJ <- get_profile('BKw2WSMAAAAJ')
id_4LH0M6IAAAAJ <- get_profile('4LH0M6IAAAAJ')
id_LdEs3zAAAAAJ <- get_profile('LdEs3zAAAAAJ')
id_pjRAVkAAAAAJ <- get_profile('pjRAVkAAAAAJ')
id_cJaAkEIAAAAJ <- get_profile('cJaAkEIAAAAJ')
id_q40DcqYAAAAJ <- get_profile('q40DcqYAAAAJ')
id_iaFxrNQAAAAJ <- get_profile('iaFxrNQAAAAJ')
id_QZkewskAAAAJ <- get_profile('QZkewskAAAAJ')
id_7U9zfakAAAAJ <- get_profile('7U9zfakAAAAJ')
id_qwm9RUEAAAAJ <- get_profile('qwm9RUEAAAAJ')
id_sKvKvwAAAAJ <- get_profile('sKvKv-wAAAAJ')
id_XmjHYI8AAAAJ <- get_profile('XmjHYI8AAAAJ')
id_02MBtFEAAAAJ <- get_profile('02MBtFEAAAAJ')
id_M4S8czQAAAAJ <- get_profile('M4S8czQAAAAJ')
id_sRZE1dwAAAAJ <- get_profile('sRZE1dwAAAAJ')
id_MtrMn5MAAAAJ <- get_profile('MtrMn5MAAAAJ')
id_7JXDmmsAAAAJ <- get_profile('7JXDmmsAAAAJ')
id_6WSjZ1gAAAAJ <- get_profile('6WSjZ1gAAAAJ')
id_u9WFGOIAAAAJ <- get_profile('u9WFGOIAAAAJ')
id_cbwBrEAAAAJ <- get_profile('cbw-BrEAAAAJ')
id_2BgnqSkAAAAJ <- get_profile('2BgnqSkAAAAJ')
id_sfhZMY4AAAAJ <- get_profile('sfhZMY4AAAAJ')
id_MB2oVvIAAAAJ <- get_profile('MB2oVvIAAAAJ')
id_fbtuxEkAAAAJ <- get_profile('fbtuxEkAAAAJ')
id_pKGWPlEAAAAJ <- get_profile('pKGWPlEAAAAJ')
id_j8F8ef0AAAAJ <- get_profile('j8F8ef0AAAAJ')
id_zsTGibcAAAAJ <- get_profile('zsTGibcAAAAJ')
id_FaXSadMAAAAJ <- get_profile('FaXSadMAAAAJ')
id_5F6nB2EAAAAJ <- get_profile('5F6nB2EAAAAJ')
id_zl6Ka5oAAAAJ <- get_profile('zl6Ka5oAAAAJ')
id_102Cem0AAAAJ <- get_profile('102Cem0AAAAJ')
id_EMDR2L8AAAAJ <- get_profile('EMDR2L8AAAAJ')
id_HWPeqy4AAAAJ <- get_profile('HWPeqy4AAAAJ')
id_hdd5Rc0AAAAJ <- get_profile('hdd5Rc0AAAAJ')
id_oQ3N3BEAAAAJ <- get_profile('oQ3N3BEAAAAJ')
id_WAANsz8AAAAJ <- get_profile('WAANsz8AAAAJ')
id_azLwpbAAAAAJ <- get_profile('azLwpbAAAAAJ')
id_guqKS0sAAAAJ <- get_profile('guqKS0sAAAAJ')
id_qu1AUuAAAAAJ <- get_profile('qu1AUuAAAAAJ')
id_Xlgbbb4AAAAJ <- get_profile('Xlgbbb4AAAAJ')
id_eqLjw8AAAAJ <- get_profile('eqL-jw8AAAAJ')
id_8EiFSygAAAAJ <- get_profile('8EiFSygAAAAJ')
id_ZqOD3SwAAAAJ <- get_profile('ZqOD3SwAAAAJ')
id_DEgcMswAAAAJ <- get_profile('DEgcMswAAAAJ')
id_iJ3CFQwAAAAJ <- get_profile('iJ3CFQwAAAAJ')
id_wiwJxYoAAAAJ <- get_profile('wiwJxYoAAAAJ')
id_J2Vr2ywAAAAJ <- get_profile('J2Vr2ywAAAAJ')
id_qx1ZsPoAAAAJ <- get_profile('qx1ZsPoAAAAJ')
id_e1SjVlUAAAAJ <- get_profile('e1SjVlUAAAAJ')
id_joN_UxsAAAAJ <- get_profile('joN_UxsAAAAJ')
id_RJNKLHgAAAAJ <- get_profile('RJNKLHgAAAAJ')
id_g90Ps4AAAAAJ <- get_profile('g90Ps4AAAAAJ')
id_cdD1lD8AAAAJ <- get_profile('cdD1lD8AAAAJ')
id_yTmQUOoAAAAJ <- get_profile('yTmQUOoAAAAJ')
id_pJWINDIAAAAJ <- get_profile('pJWINDIAAAAJ')
id_TR2KaW0AAAAJ <- get_profile('TR2KaW0AAAAJ')
id_50QEh0QAAAAJ <- get_profile('50QEh0QAAAAJ')
id_ngMTCjkAAAAJ <- get_profile('ngMTCjkAAAAJ')
id_PNkFA40AAAAJ <- get_profile('PNkFA40AAAAJ')
id_fTIU4ZkAAAAJ <- get_profile('fTIU4ZkAAAAJ')
id_XfDkj2AAAAAJ <- get_profile('XfDkj2AAAAAJ')
id_iTic-kIAAAAJ <- get_profile('iTic-kIAAAAJ')

path_ids <- c('id_QW5aIMgAAAAJ',
       'id_7RMSxacAAAAJ',
       'id_zErZQhLp9RwC',
       'id__K9lqwoAAAAJ',
       'id_tlOCzf0AAAAJ',
       'id_vQrxiDQAAAAJ',
       'id_VYE2H0wAAAAJ',
       'id_uvOBiHcAAAAJ',
       'id_qB9AdDIAAAAJ',
       'id_4zrhfwkAAAAJ',
       'id_607Z4gwAAAAJ',
       'id_3tePMT0AAAAJ',
       'id_DWi4qgAAAAJ',
       'id_eRUv9ncAAAAJ',
       'id_yvqiaxAAAAAJ',
       'id_DFmxZ4cAAAAJ',
       'id_hsJJzt0AAAAJ',
       'id_KKsqUTkAAAAJ',
       'id_hp7lZdUAAAAJ',
       'id_EPLKOEEAAAAJ',
       'id_fco45c4AAAAJ',
       'id_ku0pFmwAAAAJ',
       'id_XIehk5QAAAAJ',
       'id_v3Y_5EAAAAAJ',
       'id_gBIMWX8AAAAJ',
       'id_5l_WCs4AAAAJ',
       'id_kp9H1WwAAAAJ',
       'id_6FKqnZsAAAAJ',
       'id_qNdLNjoAAAAJ',
       'id_k505q3oAAAAJ',
       'id_blULJj0AAAAJ',
       'id_5ce8ee0AAAAJ',
       'id_SzTuoS4AAAAJ',
       'id_IL__PBkAAAAJ',
       'id_6QqrEM8AAAAJ',
       'id_WoSwwjEAAAAJ',
       'id_etLEIQQAAAAJ',
       'id_eEQstxcAAAAJ',
       'id_QypLefwAAAAJ',
       'id_BKw2WSMAAAAJ',
       'id_4LH0M6IAAAAJ',
       'id_LdEs3zAAAAAJ',
       'id_pjRAVkAAAAAJ',
       'id_cJaAkEIAAAAJ',
       'id_q40DcqYAAAAJ',
       'id_iaFxrNQAAAAJ',
       'id_QZkewskAAAAJ',
       'id_7U9zfakAAAAJ',
       'id_qwm9RUEAAAAJ',
       'id_sKvKvwAAAAJ',
       'id_XmjHYI8AAAAJ',
       'id_02MBtFEAAAAJ',
       'id_M4S8czQAAAAJ',
       'id_sRZE1dwAAAAJ',
       'id_MtrMn5MAAAAJ',
       'id_7JXDmmsAAAAJ',
       'id_6WSjZ1gAAAAJ',
       'id_u9WFGOIAAAAJ',
       'id_cbwBrEAAAAJ',
       'id_2BgnqSkAAAAJ',
       'id_sfhZMY4AAAAJ',
       'id_MB2oVvIAAAAJ',
       'id_fbtuxEkAAAAJ',
       'id_pKGWPlEAAAAJ',
       'id_j8F8ef0AAAAJ',
       'id_zsTGibcAAAAJ',
       'id_FaXSadMAAAAJ',
       'id_5F6nB2EAAAAJ',
       'id_zl6Ka5oAAAAJ',
       'id_102Cem0AAAAJ',
       'id_EMDR2L8AAAAJ',
       'id_HWPeqy4AAAAJ',
       'id_hdd5Rc0AAAAJ',
       'id_oQ3N3BEAAAAJ',
       'id_WAANsz8AAAAJ',
       'id_azLwpbAAAAAJ',
       'id_guqKS0sAAAAJ',
       'id_qu1AUuAAAAAJ',
       'id_Xlgbbb4AAAAJ',
       'id_eqLjw8AAAAJ',
       'id_8EiFSygAAAAJ',
       'id_ZqOD3SwAAAAJ',
       'id_DEgcMswAAAAJ',
       'id_iJ3CFQwAAAAJ',
       'id_wiwJxYoAAAAJ',
       'id_J2Vr2ywAAAAJ',
       'id_qx1ZsPoAAAAJ',
       'id_e1SjVlUAAAAJ',
       'id_joN_UxsAAAAJ',
       'id_RJNKLHgAAAAJ',
       'id_g90Ps4AAAAAJ',
       'id_cdD1lD8AAAAJ',
       'id_yTmQUOoAAAAJ',
       'id_pJWINDIAAAAJ',
       'id_TR2KaW0AAAAJ',
       'id_50QEh0QAAAAJ',
       'id_ngMTCjkAAAAJ',
       'id_PNkFA40AAAAJ',
       'id_fTIU4ZkAAAAJ',
       'XfDkj2AAAAAJ')


my_list <- list(
    id_QW5aIMgAAAAJ,
    id_7RMSxacAAAAJ,
    id_zErZQhLp9RwC,
    id__K9lqwoAAAAJ,
    id_tlOCzf0AAAAJ,
    id_vQrxiDQAAAAJ,
    id_VYE2H0wAAAAJ,
    id_uvOBiHcAAAAJ,
    id_qB9AdDIAAAAJ,
    id_4zrhfwkAAAAJ,
    id_607Z4gwAAAAJ,
    id_3tePMT0AAAAJ,
    id_DWi4qgAAAAJ,
    id_eRUv9ncAAAAJ,
    id_yvqiaxAAAAAJ,
    id_DFmxZ4cAAAAJ,
    id_hsJJzt0AAAAJ,
    id_KKsqUTkAAAAJ,
    id_hp7lZdUAAAAJ,
    id_EPLKOEEAAAAJ,
    id_fco45c4AAAAJ,
    id_ku0pFmwAAAAJ,
    id_XIehk5QAAAAJ,
    id_v3Y_5EAAAAAJ,
    id_gBIMWX8AAAAJ,
    id_5l_WCs4AAAAJ,
    id_kp9H1WwAAAAJ,
    id_6FKqnZsAAAAJ,
    id_qNdLNjoAAAAJ,
    id_k505q3oAAAAJ,
    id_blULJj0AAAAJ,
    id_5ce8ee0AAAAJ,
    id_SzTuoS4AAAAJ,
    id_IL__PBkAAAAJ,
    id_6QqrEM8AAAAJ,
    id_WoSwwjEAAAAJ,
    id_etLEIQQAAAAJ,
    id_eEQstxcAAAAJ,
    id_QypLefwAAAAJ,
    id_BKw2WSMAAAAJ,
    id_4LH0M6IAAAAJ,
    id_LdEs3zAAAAAJ,
    id_pjRAVkAAAAAJ,
    id_cJaAkEIAAAAJ,
    id_q40DcqYAAAAJ,
    id_iaFxrNQAAAAJ,
    id_QZkewskAAAAJ,
    id_7U9zfakAAAAJ,
    id_qwm9RUEAAAAJ,
    id_sKvKvwAAAAJ,
    id_XmjHYI8AAAAJ,
    id_02MBtFEAAAAJ,
    id_M4S8czQAAAAJ,
    id_sRZE1dwAAAAJ,
    id_MtrMn5MAAAAJ,
    id_7JXDmmsAAAAJ,
    id_6WSjZ1gAAAAJ,
    id_u9WFGOIAAAAJ,
    id_cbwBrEAAAAJ,
    id_2BgnqSkAAAAJ,
    id_sfhZMY4AAAAJ,
    id_MB2oVvIAAAAJ,
    id_fbtuxEkAAAAJ,
    id_pKGWPlEAAAAJ,
    id_j8F8ef0AAAAJ,
    id_zsTGibcAAAAJ,
    id_FaXSadMAAAAJ,
    id_5F6nB2EAAAAJ,
    id_zl6Ka5oAAAAJ,
    id_102Cem0AAAAJ,
    id_EMDR2L8AAAAJ,
    id_HWPeqy4AAAAJ,
    id_hdd5Rc0AAAAJ,
    id_oQ3N3BEAAAAJ,
    id_WAANsz8AAAAJ,
    id_azLwpbAAAAAJ,
    id_guqKS0sAAAAJ,
    id_qu1AUuAAAAAJ,
    id_Xlgbbb4AAAAJ,
    id_eqLjw8AAAAJ,
    id_8EiFSygAAAAJ,
    id_ZqOD3SwAAAAJ,
    id_DEgcMswAAAAJ,
    id_iJ3CFQwAAAAJ,
    id_wiwJxYoAAAAJ,
    id_J2Vr2ywAAAAJ,
    id_qx1ZsPoAAAAJ,
    id_e1SjVlUAAAAJ,
    id_joN_UxsAAAAJ,
    id_RJNKLHgAAAAJ,
    id_g90Ps4AAAAAJ,
    id_cdD1lD8AAAAJ,
    id_yTmQUOoAAAAJ,
    id_pJWINDIAAAAJ,
    id_TR2KaW0AAAAJ,
    id_50QEh0QAAAAJ,
    id_ngMTCjkAAAAJ,
    id_PNkFA40AAAAJ,
    id_fTIU4ZkAAAAJ,
    id_XfDkj2AAAAAJ,
    id_iTic-kIAAAAJ
)

TurkPath <- map(my_list, unlist) %>% 
    reduce(bind_rows) %>% 
    arrange(desc(as.numeric(h_index)), desc(as.numeric(i10_index)),
            desc(as.numeric((total_cites))))

xlsx::write.xlsx(TurkPath, "TurkPath.xlsx")



number_articles <- map_dbl(ids, get_num_articles)
names(number_articles) <- ids

oldest_article1_20 <- map_dbl(ids[1:20], get_oldest_article)
names(oldest_article1_20) <- ids[1:20]

oldest_article21_40 <- map_dbl(ids[21:40], get_oldest_article)
names(oldest_article21_40) <- ids[21:40]

oldest_article41_60 <- map_dbl(ids[41:60], get_oldest_article)
names(oldest_article41_60) <- ids[41:60]

oldest_article61_70 <- map_dbl(ids[61:70], get_oldest_article)
names(oldest_article61_70) <- ids[61:70]

oldest_article81_100 <- map_dbl(ids[81:100], get_oldest_article)
names(oldest_article1_20) <- ids[1:20]




require(scholar)
get_oldest_article("QW5aIMgAAAAJ")
packageVersion('scholar')



# number_top_journals <- map(ids, get_num_top_journals)

number_distinctjournals <- map_dbl(ids, get_num_distinct_journals)
names(number_distinctjournals) <- ids

# get_publications

publications <- map(ids[1:3], get_publications)



# master df

#find doi

# cite space, vosviewer







    

# **E- direct affiliation pathology & Turkey**


# myTerm <- rstudioapi::terminalCreate(show = FALSE)
# rstudioapi::terminalSend(myTerm, "esearch -db pubmed -query 'Turkey' -datetype PDAT -mindate 2018 -maxdate 2019 | \
# efetch -format xml | \
# xtract -pattern Author -if Affiliation -contains Turkey -and Affiliation -contains pathology -sep " " -element LastName,Initials Affiliation &> TurkeyPathologistsPublished.txt")
# Sys.sleep(1)
# repeat{
#     Sys.sleep(0.1)
#     if(rstudioapi::terminalBusy(myTerm) == FALSE){
#         print("Code Executed")
#         break
#     }
# }
# 
# 
# rstudioapi::terminalKill(myTerm)
# readLines("TurkeyPathologistsPublished.txt")





