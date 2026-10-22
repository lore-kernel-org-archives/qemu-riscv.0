Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F1460A3816
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMdnp8y/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EARuc2SR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xK0i6-00063Z-0i; Thu, 22 Oct 2026 17:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hl-0005Zn-VB
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:52:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hj-0007Uq-N4
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:52:09 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MIHO8h3742046
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5OpFreQ7B2ouYTSNvR3u+QcTMtI9AUDrqhXN3lPkFMM=; b=EMdnp8y/tJcf8SqY
 dCZ+cyTfIrkXU42AkVLelqt0gsAhuxRqIHioM1ypYttZuUg8Fkjb/owDgcODT7ZS
 d72uQDHpvF8vv8CQ/2jC5+UKX+6fb9i7fGEx/+w1y462huHSb6AzX+Q1IXddmRwr
 gesWEMZvmRWSghBis0gVjz4CnK1QMfaqdVNPE1z4bkLEGeKEI0BOzaLixcPar9eO
 9338d6LHfbqsIxcvirZ5p8/RIkDw/zVVJrE9z7iqPJqbTdxTHd2SKJr9lP8ialZb
 LxJo5E6uAzqLnNxU2UU5iUrhgkE0cSUDagB5tofvuG7heF434roVQHm2Tye7iL4d
 gB21dQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms0pt2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:52:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3548cdfd2fbso369643eec.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705926; x=1793310726; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5OpFreQ7B2ouYTSNvR3u+QcTMtI9AUDrqhXN3lPkFMM=;
 b=EARuc2SRzRFdDWxI9t1LSv+SROA6zjjrFpY8vGQoFXsO8498w6Y14vPoA1fQOiUMw8
 +BSOJt/5jtiQCPMAPPzwtP1kpQOft8Nv8EK6F/ntaHyifQulydEsuYQcssEU2KqteeWF
 1NmIdoBJ+ACRIxhwH9d2CB0lnlCb28dFk3bsBG2AAZS29AncJjkGj6+SaNNr5oGtAMh9
 3FQT6n+IxWurQ/NEc3TDn7hrHyFjkVvdVKrr6hKjjLfGMeH46jl7R2+odC4aNV45zcvZ
 IQZlKuaBsWci7vKJuyS5H7pxlYVZ4FvoIAeT8gNRMmHuEln4m1fanV5x5pHJzXhlGuyZ
 kz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705926; x=1793310726;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5OpFreQ7B2ouYTSNvR3u+QcTMtI9AUDrqhXN3lPkFMM=;
 b=yAoD42ZNv8G/ZFotVlpTKArh3SDQjnChyhFnpIiWwNLoPzIeDucAUJaWa1EtRNsW/z
 a/Xt5c2yp4K4wa7DdGaijdIK36YrVlDFR1FgzY6Ee0h9/DPKjShR9eamVzAI35sohy9c
 lILcbsROh7Q9vw75sFLYYmLoGHX8KBW/KDzVajd+ZqiOgw4pyksCaCZr2CdzjasI08SB
 g/JFP4Qclg1vxo9xJ6BwHax5Q2aM21GaNlRHYsiXFx9m+yLxHOzncMF0A3CIVzp/QzzA
 DiyXChrQQNUrHkEaSlxH0Veui1CtjrsCudKVKIch0Hy+I5ft4FHyMNwCEEejup6WvG1V
 ON3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzjevKHy2xiszC66vZZO2g3ulvQ1XbvVD7HfydiXVTBx3p+cTQJZZhPNs0ZRNg4FfL2OEDcdE/4PjWp@nongnu.org
X-Gm-Message-State: AFq9FYLgshNBbcz90TaYi0X5iyOhACmxgVn6X1GqTrj+4UA+FEJfvTsN
 x63nR9S0QLRVjkrwkE/3lpFwlZNKrk+VOobaCsBMshcqG2TTJv6J5EqJggqyG9FQm8Gw+J8ilEC
 jrinUyzQJ40hmOdFsl03THY7haUrZtbetglwA00Z6V8mPuyy3HPSxb5Hxgg==
X-Gm-Gg: AYBFou1DLMUYbJxcOv+ecl1r6SD1Bx36qWaXVPQ8iBc0c6AN+YGpTcLFDL4iIckXE2z
 97DO/nxUMl2bfN1vwxLPAqfzkRIERueDp4i0N5l6nsdU7W5P4rFSKFmdWGay/aCCulFPeIgHf9P
 Ok3IumFp8VlZ9pS4Pj4IvchGNSAdJpijLYKmaHzpnPsY8tAidrvJCRX6YQ0LL6xmL+85AAzBlXG
 a6PqVlxvI/0j76qGbzRBMnfghBQU9Ajz62o0JwF0T/TH1bAmLN3sPHFZ/s0cbYYrFbtz7upDCEJ
 i6XbTnNTOJa6bPJd8+MVz2FdOjcWDw+Vj1+cn8BFfauta0axOGPKgib7fPIlHoF/EwB92N8dnS8
 FSnfM5L1JhDswT1TQfw2xRcjfJl86my8yJnZzTEbU57MOTy+mUULbVGc/+tx2J4cj0lEkDQ==
X-Received: by 2002:a05:693c:8641:10b0:368:2548:c076 with SMTP id
 5a478bee46e88-369d980e176mr567533eec.34.1792705925230; 
 Thu, 22 Oct 2026 14:52:05 -0700 (PDT)
X-Received: by 2002:a05:693c:8641:10b0:368:2548:c076 with SMTP id
 5a478bee46e88-369d980e176mr567486eec.34.1792705924717; 
 Thu, 22 Oct 2026 14:52:04 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9d5ea64sm1006091eec.5.2026.10.22.14.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:52:04 -0700 (PDT)
Message-ID: <07a0cd52-6fcd-43eb-a639-32b56bb6a043@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:52:02 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/18] monitor/hmp: remove legacy MonitorDef
 infrastructure
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-18-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-18-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXwiF6HWovFN9E
 exWjrpkon1kysVP4FDVwTezvX20fy5lOlTYY6HZBk0ghOPKhsmAxbL8njasfU8lvxohYV02Y9Pj
 BJ+TTf1uztwas7a+0Oq6GsFjaOenseFEJ5fl4Iu/3SD95wx5IbDWiz8yuSR3vaKsyFqNmFLo3G8
 6d5WvB1gPFO7H058NMpiex2UoGVReW/mDsLm2RpeIhZL1j7v65G1f+48Vg2B7kce0KRR/QyLXaY
 PnBAzAtn3Qx3dy0ti1CTAE+R3F5E/XBBcAEjvd/JAP4AU+YK6l5QqiFvlu9x/dWNV+Lmrb0EiWZ
 X0ttcAhZrxoCM6ucHPdsTzuqZfvoBJyDzNCbg91Mcl5lZawZISe5RO4OFdP4jMCi1CNTZhTQXbg
 Kgbni6l7I0vLAHEdAxBZJqjcMw6FdXo5e0OS0DX/4icq+eGbKyNX0L5n1QVFF0g8WM81fZy/aHK
 WQpQuy/W96Kt3Z7siAQ==
X-Proofpoint-GUID: suomtD-xjDtEo46-J1gg4Txs8X8ivqDz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX8OYwrZ8RymMn
 9T+EA2CyXOcZcUeQ38OlAqyd4GxYoWi6QpAhtNUbg1KotweKryceMf1Uu1BQ2buZ8O9jImaxXBS
 Ob2mM3xbba51bctFmkBzgXFBIuh5crs=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6ada8586 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ddFTbBm2uw4GCDNeYIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: suomtD-xjDtEo46-J1gg4Txs8X8ivqDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Now that all targets expose their system registers via internal GDB
> register descriptions (i386 segment limits, m68k, sparc64, RISC-V
> aliases), the legacy MonitorDef table and
> SysemuCPUOps::monitor_get_register callback are no longer needed.
> 
> HMP $register expressions now use gdb_get_register_list() exclusively.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/core/sysemu-cpu-ops.h | 16 ---------------
>  include/monitor/hmp.h            |  6 ------
>  include/qemu/typedefs.h          |  1 -
>  monitor/hmp.c                    | 43 +---------------------------------------
>  4 files changed, 1 insertion(+), 65 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

