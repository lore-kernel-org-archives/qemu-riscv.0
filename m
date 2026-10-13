Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BEFCC6B0F
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 06:58:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGWS8-0000VU-RZ; Tue, 13 Oct 2026 02:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGWS4-0000UM-3j
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:57:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGWS0-0005s5-HV
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:57:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D6CWRo949569
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 06:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9GdmlAg+r0KBNbesZT5lUmE9s7Gfh3qJj15TaW/3QHM=; b=nVrxRbPNFesXQXte
 z9L5/buQ8gCsPjsFkaFjTfuFG3jkRJtt7fdbqZdpYrLkfvnYeWHEEkWHVrzv2zZv
 0jnESq7oV8s4WsyrHgjAAJcZgXQIyaysSpdabsSCfcArMaGypraJutNOItiH6qFb
 FU89NpJ1cx/CXX18cjAdNWyCp9FkU+sVQmx4iKISoexNcGWVkWrZvsKf24DTzXis
 bzY3YhM/v6aYGMFHCY4hHbQJtQs4Wv5RXEYHKkw6X2MwxKIaeEfA/YSDveIhx7Dy
 bkn2hMdNCnftdn5xpdOmwbR7m12ISicMQnIfW/4emiiZPpGKHbQ2Inz5UNwt+E8X
 JLFfgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6285f2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 06:57:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93be1861d2dso401693185a.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 23:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791874646; x=1792479446; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9GdmlAg+r0KBNbesZT5lUmE9s7Gfh3qJj15TaW/3QHM=;
 b=J7zgfnfKsBO5NWP0VAdeRpyK07fEbgq5y98kGnyNLmB/jRwsHd9ZL2V5JVxi0HSu/3
 dThKOAFxq8+Kb2sAUnP5srmvr4bEvJNYIhh3S12+s3LGZNdKBqit4Ua3aOhEokfCa+Z7
 bL8SofmNJvjwuYdxtEMKnWT/BimpHRV77xMFnlxEGRL8y4sRVDMYha5x4ajKahpTrfbA
 xqn6V3JPE18oj2rJQxqA13AnWVv7/FUgyCN8A40EQGBQXPumFHsMFO/Tl7LIo4wlcC4D
 hvoGhvAbvUpEgUrhfQok92E9RzhF9dBJpbI8IUk5akAd6O+L3Nymf40pGPLnAssNE4x2
 o0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874646; x=1792479446;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9GdmlAg+r0KBNbesZT5lUmE9s7Gfh3qJj15TaW/3QHM=;
 b=G+pEj+9n/AsDEiotS0aFHNo7HLOPkcJMx8sxEdf76JNb9mE3XqD1qyZg6RJbQ7j7Q2
 QQZYy4sAhnwwzRx6kHgIFuEOVcbFptGY2Sl6HHdA16a5fWT36omJvQY2z3MVk6B8hGzT
 2vIk0iYZYmsZ6weHPwBAA9R1opXhauKLuKHqB3vCDR+MJ/qiRCtuWe1mOPzjNtECbPq8
 uGrOqVZ+MgC2rKEG4gRmyUBR4fNYaRMZdQsjb280vcfxzjfzMjds+Uvmg5utwyXw7i7n
 mJabWT24GNKQfgI1+NR5VIUHu7VRY/ocozdzWvs+jdFNNXOj3ol8BQOtP55H6wkNH9ZX
 zVoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByHH+MLyxYyVOEf30WYqNbNxE3IXuYw0C7kpD0E8CCCxhCY6+hUMkp/qCo4LXkbd0FLEGuskQoj+Y8r@nongnu.org
X-Gm-Message-State: AFq9FYJ9dLZN20aGy1AgTcBGZMDiow0T4Dw6nV8StzL2j091xJfauMMo
 /3O5/8D/wzqaLUJLbFiImEypOtvkGOGsoqbhDkiNWIM4VEcMJTHRdQpXBiEzLxL8SJjKJn66z99
 sXW79nYDLbaOChCvs00i1FonPHxdhVbBM3ztfYyBY58I+tEGOfLf2U9anAw==
X-Gm-Gg: AYBFou20WinDkQH+mBKdhRgIplEFL1BS09v65DtlgICUi2h2zWQErVotxPmjVrscgsP
 oYio319z8o82A0LAmPtwLw08Ftjp6zwNnC3CuhTAWiOnPIt15zIeWt0zH8YTcbR1YjNY8vNoNIY
 YdSm4xWNiuKQ7ucPzdzxQMLKGo/H18b+6hAaBTE3xHm+/40jVF9nOf39lT/pDJGbKRl769Jd3sh
 wSsEyro/tNics/eMFWIPk/j9U7g+Xs/LSXZ7vMSyfXRfJwKwPzjkXxSQgzmTe5OuUPwKeIjp65Y
 38TrSAzcck9xA/DFWxMwH1eB/rSRQ3kUKS5sQFvxdABwGRnsx8Y8jQy+xvSS1NYIUhJ0DDFj/JR
 rrVF4FT7dcl8dRw6VqUVyAN/RoFNhet0DfQ==
X-Received: by 2002:a05:620a:2a14:b0:93e:4d74:68fd with SMTP id
 af79cd13be357-93ebd2ab63bmr2029142985a.65.1791874643486; 
 Mon, 12 Oct 2026 23:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2a14:b0:93e:4d74:68fd with SMTP id
 af79cd13be357-93ebd2ab63bmr2029138985a.65.1791874642429; 
 Mon, 12 Oct 2026 23:57:22 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf15691sm335604325e9.6.2026.10.12.23.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 23:57:21 -0700 (PDT)
Message-ID: <e883fd2c-db22-4f29-8df0-acd5a5e9d9d9@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 08:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] target/sparc64: expose system registers via GDB
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261013-query-reg-v2-0-6f95a2e139a9@redhat.com>
 <20261013-query-reg-v2-7-6f95a2e139a9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261013-query-reg-v2-7-6f95a2e139a9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdd656 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=rB_AC_PIbXsWsa49W_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyNyBTYWx0ZWRfXw93Sj6cD4oop
 C9e58Mklkne5+PidWH+W1zQgat974EisL7Mp233IvDghT+4vyZQ/tWs4mtqS/MzUsTFkbSbFFr5
 NJTnVqGhfa0e05pe1X5BliPFJ4e+Btw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyNyBTYWx0ZWRfX4yt4NKEPjczI
 yDgN76hkxE/UsDhW93nZNNduVE2pV+4JpczpdLNmQIwNedu5toLaVZvhpKnj+ZfLc3huObLh3fl
 rEKB7gWK2ubRR0INp4RN8q4XLj/Z4+gmcdY28v79GbwddD655XQAExDhYurvPxbBPIteJ+xCbfP
 KOwEH8YzQdIoLaxM3yjAtCx7IaVuJCYFRX6OHuCIcJf5IIhuU9SboP9Jk1zVf1w1TG+GVbrC9iM
 9Bn62qDtFQ5phMB7nisyxTOzPHPY5G+H+abEoZLkSJYkljmsweR42JDko3eN5FbXKpOFKCgOhY3
 5il96hvHpbZSMCTO8NouMcyHyvmgBKMRRwjXVtGW9rEeYIhogCAaoEMulBP2N5PW14ZoZSkhCRc
 Q0Uke0GdkM3bv4oyxYoBh9xRqcxUvgCGNP7ZwNYIaMhftJKVtOEjwcizWy3iVwnh1y+cBefz5M7
 TzsUkCPPn+R3Awul0+g==
X-Proofpoint-GUID: aiu-4Xx2620k6nuikdmKdI2pGFjikdWR
X-Proofpoint-ORIG-GUID: aiu-4Xx2620k6nuikdmKdI2pGFjikdWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/10/26 22:34, Marc-AndrÃ© Lureau wrote:
> Add a sparc64-system.xml GDB feature that exposes asi, pstate,
> cansave, canrestore, otherwin, wstate, and cleanwin as read-only
> system registers through the GDB coprocessor interface.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configs/targets/sparc64-softmmu.mak |  2 +-
>   gdbstub/gdb-xml/sparc64-system.xml  | 22 +++++++++++++++++++++
>   target/sparc/gdbstub.c              | 38 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
> index 4e621fb8e39e..7f2789136653 100644
> --- a/configs/targets/sparc64-softmmu.mak
> +++ b/configs/targets/sparc64-softmmu.mak
> @@ -1,7 +1,7 @@
>   TARGET_ARCH=sparc64
>   TARGET_BASE_ARCH=sparc
>   TARGET_BIG_ENDIAN=y
> -TARGET_XML_FILES=sparc64-cpu.xml sparc64-fpu.xml sparc64-cp0.xml
> +TARGET_XML_FILES=sparc64-cpu.xml sparc64-fpu.xml sparc64-cp0.xml sparc64-system.xml
>   TARGET_LONG_BITS=64
>   TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
>   TARGET_NOT_USING_LEGACY_NATIVE_ENDIAN_API=y
> diff --git a/gdbstub/gdb-xml/sparc64-system.xml b/gdbstub/gdb-xml/sparc64-system.xml
> new file mode 100644
> index 000000000000..e00baedb467e
> --- /dev/null
> +++ b/gdbstub/gdb-xml/sparc64-system.xml
> @@ -0,0 +1,22 @@
> +<?xml version="1.0"?>
> +<!--
> +  SPDX-License-Identifier: GPL-2.0-or-later
> +-->
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<!-- System-register values are read-only; writes are ignored. -->
> +<feature name="org.qemu.gdb.sparc.system">
> +  <reg name="asi" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="pstate" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="cansave" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="canrestore" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="otherwin" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="wstate" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +  <reg name="cleanwin" bitsize="32" type="uint32"
> +       group="qemu-debug" save-restore="no"/>
> +</feature>
> diff --git a/target/sparc/gdbstub.c b/target/sparc/gdbstub.c
> index 2874ce1b3501..efbe16f38aa9 100644
> --- a/target/sparc/gdbstub.c
> +++ b/target/sparc/gdbstub.c
> @@ -266,6 +266,39 @@ static int sparc_cp0_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>   #endif
>   }
>   
> +#if defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
> +static int sparc64_gdb_read_system_register(CPUState *cs, GByteArray *buf,
> +                                           int n)
> +{
> +    CPUSPARCState *env = cpu_env(cs);
> +
> +    switch (n) {
> +    case 0:
> +        return gdb_get_reg32(buf, env->asi);
> +    case 1:
> +        return gdb_get_reg32(buf, env->pstate);
> +    case 2:
> +        return gdb_get_reg32(buf, env->cansave);
> +    case 3:
> +        return gdb_get_reg32(buf, env->canrestore);
> +    case 4:
> +        return gdb_get_reg32(buf, env->otherwin);
> +    case 5:
> +        return gdb_get_reg32(buf, env->wstate);
> +    case 6:
> +        return gdb_get_reg32(buf, env->cleanwin);
> +    default:
> +        return 0;
> +    }
> +}

Why not remove the sparc64_monitor_defs[] array at the same time?
If doable that would ease logical review.


