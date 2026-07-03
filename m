Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB25C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 13:22:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfdqS-00024K-OV; Fri, 03 Jul 2026 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfdqR-000245-7J
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:22:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfdqP-00025j-N3
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:22:14 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6637IZ8o3195362
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 13:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pVHuRStHudNkoKHplW8emHlKSlT6Mn8WyW3SNIHJhMQ=; b=k8zYZcdoNUYdboo1
 Esw3dLF12C0H5hRrfN2JOHjwIhB4GDNuPrp8AP27qkiOLkpNWD8lggRZ83OsHktI
 KLgIh3qRVViEyJCOtKn7Wp4oDk7aw810SDUqNOTJFjyBgbkOaFKjlry2CDF28nIC
 oke/3HzOGVebo86s71mcYaWOV8bX/HAhZWe0u2ZbN19bp99fpFkkONPDI/DyMBjv
 wh7IodkJW4tyfts/NAw0H8tfOKU2saPn/ZxZAsHdYWrkI1iLcW5myz8KYtIm017p
 4M4qN9lehGsKsc3vdK06G4aXqqMiiUrSaH+sbB7hg/QWB1OgnKtnkxrG+JtR4l8A
 GpmvJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jysbsk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 13:22:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92158791d14so49784185a.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783084928; x=1783689728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pVHuRStHudNkoKHplW8emHlKSlT6Mn8WyW3SNIHJhMQ=;
 b=VBO2ZgzrRrMVLQeh11sV8ipTDg+NcuSeDXRB+F5BhBkLgIBDDrED8Ep9nEIvpPexwt
 zHimz3p2ml+H4/oSjZQLfpVBYaakU7UmSAULePGrG6n11IXzdNeEjqSzUkmsmvvlOUny
 O2qw9upiVAe6khC2sLskXUMQszTkB6SChp1nmrnvbZuI/FkS4ygfyXI07xLwMCOj+Gf0
 JaDfJj/htt18m+DmG8M8xGcTorwtixH4YBjE2pMCQVHMJgRYuQdkA5E67hIX3P7FK7GW
 0bhv6l6Itq6jtLkkGsc2Zpt2RBeHXc899oUatSkPt2SobJkyzHUgkWUd9QeOe+ToMSyA
 JYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783084928; x=1783689728;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pVHuRStHudNkoKHplW8emHlKSlT6Mn8WyW3SNIHJhMQ=;
 b=gpiH4nWZYllaMFBIJNMdfk9DJCizneQxy3hmvHSI/foa+TOn5iifUxBJxolF9r/GJC
 POBOOk+GJkPE+nXtmwcCx/0vhdj456ed4dQaDeGDH7Mj9Go23excjZPpTt+6yoAKaWKA
 O421AUI2hbxCP/vljhengxLyLMsSDgdu6U9GPrzC+lafzpDv+eVsrTI6zzoc3SflOK3M
 X2kv1ml13XHomookv8eu5pxfV5HSdbEGudmIiijPOt0oJNyC8EsldCg/XCBkOD41UPn9
 BmJC6tIFy3wLmoCbnR61U69uCHsMtnC38T79KyW+ueWoCsdu6ho516Lo8iXJ3HdgmE/H
 ZCew==
X-Gm-Message-State: AOJu0Yzjcntow3cds8+V/gMBTFr9gtv9yb6RejNYIMBEZYjxUPA+iIVL
 EgKB4odFQI6whucsu+crT4ScEwZv+ciW9SmfeZEV5AE/qdUHld6//KGMeFelXYHiz0+PshhbsRZ
 +dLaw2D+Z5mWS7erz93QtuKZ9uphaTWrkFqGBcyr5u8YE1V8chnWk9bvYHA==
X-Gm-Gg: AfdE7cn0/+hGHpUY3Fvedfwe0VwlWuauaffeqHRozfTaZmGMIla4etNzZLWRQEdhGxO
 +5Y77Ybe35Iu1MHalRH3QfrT1VyMuSLB9QX80oW3R+HS51WFBoCQGRrAVYwl1WXH6B5MzbJnqJA
 YE5yZLdwkZlqCl3I4Hi10abbfCF/GVqZ+3FDboZl49jRkNAdlJbii7buUQTv0ysOZcZOG+42vI6
 GZvEQ5cryd6AuHj2gIBvmqx3YoqZ7rZlIy3ruFb9sIHJ+ElNn7Fldtmf20YRBBmfwwvM6LaiW4G
 E51gCPocH4HNccQGr7oeyeXA6Ju7WezT3gFvQcGQqgXGrffzXfsfaJ4CuEcah7BpodHgAGws4Pm
 Ficw8pCIGoeaIddwENF86jblJ+IbnfweS45b7FF0KPxEW
X-Received: by 2002:a05:620a:269b:b0:92b:7420:bd7b with SMTP id
 af79cd13be357-92e7b473345mr1225296085a.66.1783084928413; 
 Fri, 03 Jul 2026 06:22:08 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:92b:7420:bd7b with SMTP id
 af79cd13be357-92e7b473345mr1225286885a.66.1783084927571; 
 Fri, 03 Jul 2026 06:22:07 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e90cc18f1sm153855585a.40.2026.07.03.06.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 06:22:07 -0700 (PDT)
Message-ID: <da9d6da1-bc2a-4108-a522-5e8e41ad9c6f@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:22:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] target/riscv: move pmu.h to tcg subdir
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-7-daniel.barboza@oss.qualcomm.com>
 <374abf50-4593-4888-bb9c-2ef731b6d7a8@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <374abf50-4593-4888-bb9c-2ef731b6d7a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMSBTYWx0ZWRfX/JLnlgUmS5f+
 CvCuiKT/TDB52rs+pQxnJ8gAKdk2L1o9iK/BqVIdv0sNhpp4Wdk/1jdLRc1mWYjbEReSK7z03Rn
 EipoWrdbbAXCZvvQjOCFEcjlmPhoJCdE+csowhulNYHOzX8pQbftxl4IuZUPHqW0KyV0Rb8KH7V
 O0OHxF2Wv6ynbjb4PLJUQjgb+07PF0xO77RNykMEep++mVjBkMaGyWSReQxxWM0iDT1afCDx7ai
 ytNR9JVLYR+lGX+wCv5P+YhtHZCn8Sxf9BU/LtZ4x1xw1VIcKSWeiEq1hFwePMJ9dGRVq9qR0Ym
 ncdccU4KXfaCOaOOXRynLYWEejusDjhfQ6LoMYU4oz0Vevu72eMIyYPjyOGtY1mgMWR8yfsIbPY
 nSIGpx3sEc5rMW2AhqgQ6jPweMwRUbWHHDiXG+mA+hJ3pubtCNy3WtqdZItjojwlJxi2K2+0Ejs
 /yMgcsqTz2zV0LB/vJg==
X-Proofpoint-GUID: PMmtqgs1gFy7lqUIsM4mkOrJX22tk899
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47b781 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=2aFWFHZrbJ7EhV8P2DAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: PMmtqgs1gFy7lqUIsM4mkOrJX22tk899
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMSBTYWx0ZWRfX8PkUWLu8SGxJ
 fOt+mloMtPQRNodI3eJlsf6IoI4kQCoShSKVFIbg0aySNqPJhibSVPRarJsbXwyXL4r51rSv1DL
 RAqrnowF4dbWEBhgVwe/ywD3eIJqt7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030131
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/3/2026 7:44 AM, Philippe Mathieu-Daudé wrote:
> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>> riscv_pmu_generate_fdt_node() can be moved to fdt_common.c since it has
>> no PMU TCG internals.
>>
>> With this change we can remove pmu.h from 'virt.c', which is now
>> becoming a tcg header since we're moving it to the tcg subdir.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
>>   hw/riscv/tt_atlantis.c        |  1 -
>>   hw/riscv/virt.c               |  1 -
>>   include/hw/riscv/fdt-common.h |  1 +
>>   target/riscv/tcg/pmu.c        | 52 -----------------------------------
>>   target/riscv/{ => tcg}/pmu.h  |  1 -
>>   6 files changed, 53 insertions(+), 55 deletions(-)
>>   rename target/riscv/{ => tcg}/pmu.h (95%)
> 
> Preferrably before patch #2 "target/riscv: move TCG only files to tcg
> subdir" if not too much trouble:

Done.  The helper is now being moved before patch #2 and pmu.h is now being
moved in patch #2.

Thanks,
Daniel

> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 


