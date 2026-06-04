Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B1FCD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV51z-0005ki-82; Thu, 04 Jun 2026 06:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV51y-0005kN-4O
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:10:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV51w-0002OH-77
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:10:29 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548NuUA141895
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pJrIDcyNveHXQQdDOKsJH34DZmo65dKBbxfMNwQmK1M=; b=lMDyRyjybHyOXtRK
 JVWHEekzrT/VKFXwzAfpzJYRqDknm00buLBlR9sZQzWAM+6GgQlMbee6sjPkKElY
 RMyhi9NABG9zFRfP1+j+w4OuBtvLhIClwDj5ZIUkQXniZRhOkETM/5rTecBzRnta
 rv+qHwnYC426pl0PiNUytX51Zj12G6PfRpxQYClyUK7w+hmM6W4lAyxW9U41eH3H
 /FxTSXlx6mFqmpZWjNDpEdpU6AVRVgq5f5n3808f6z/WPZi+HCY5RqtZlQKj7vFl
 HnFkIYLK4YkVuAF3DjSMVD9Nk9dvlsRJniswyM+sMz+6MWQxdhhQeeiMi7KFTTA/
 6kxY6g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen9spj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:10:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-59ebabec151so897413e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780567825; x=1781172625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJrIDcyNveHXQQdDOKsJH34DZmo65dKBbxfMNwQmK1M=;
 b=RzbNkg8hCi1EL8y4/ZaPcftQjR5GGZGEAlMBNVZUi9JkH53oIbPtFelbp5UBxy6SRq
 UYtNri7wSu9pAGPqMJLMqKojFyyrO8KpB1BuoppQH9pJIyM2mFViRFg0UJby2B6oQpim
 IGhlj+nBBcU5Jag2UYMkCnGn6KPQo/tnA7k9GAtfdkwLhhMUKjpoM2k3LUhfgXyfzgb7
 vORCfETI6lJ79trgMiH7i+0RDtk2p1FQ8VKO5WNpS+orW5QcMA4aj44i7i3DIrBsuCw8
 CshmsOTuIR1nYUYJdZZwu4yiWoM38vGNQr2em1RnZ1KgC0tWtEY+mLCAFWK5rR7Xq8QY
 FyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780567825; x=1781172625;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJrIDcyNveHXQQdDOKsJH34DZmo65dKBbxfMNwQmK1M=;
 b=XkNQcw6Jv0d7mC2bV00qLLEJYNnR/uBUS4WwjcnUtwacsr4Ij5LvQF3u65AGPYrQB+
 9hu8kTsY5T2/S9NoKxdss9wYaKuu6LKWk18RHEnhe6ShIG8nQ3QDN8O0ZVJOexBdBYMc
 nR5GMDSO3bCGIB1YshKX3ZVTlz/7tI/4tmrNKfnyrWf3hSUoZOJtroavNs+BJqPMK2Eg
 p1ryhE32xM8GdZOOeiwtSI2zixGi6UVAsaisRI3L3nZ7x0qxRVwpwc3bOe4naVQtkFwy
 zPf9g6d4bGr+3UVNEJ4ssCpZATxOJEbi1msVJuDG+6l37jQXOSTMsAGc0Ldw36tI4m8c
 L4og==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rlK/vQvM1BmB/k1JA/hKZjv4+BCkmcskBc9H83svsMNXBHYVcxTNs3lCyypcKaLEmmpG5hmckAwWP@nongnu.org
X-Gm-Message-State: AOJu0YyesKo914MmUojROfFblvEVdF32qXeZ/qiv9E+oZvGnu7vdR1sy
 XAVjYcue00bvjvZXxuxyIPttsDo3aXT6xWB+k1DF5s69lxPF90yIoJcnzs5wEJPbByFY/Mw6Hqn
 dYcZnOvippjJHM3YhbRNYbMniKdp8kxGkGJmGMoLf4LULakGVf6YCvaAn9w==
X-Gm-Gg: Acq92OGUs7IB0L9b+zoW7rDTAT8TMA5LJjAdVJQey9Bub61hO0sNKgmuc3oeVMUfO8E
 NnCDVUhzGJhd27TEtHN4T8RKh1wYP0Etwv9HErzvX2Fh8giNL8LThk0ue42PwrrSXDaPsT2AILj
 SIne1pBHGgaDiM4zF5RXdMNGyBYLMntzPKZoy9UmQuo71skI9eG+pwoumBuz/U/ttenydlFIZbl
 j0G6ygM+Asa2YNFndxPHrlx7apmATm2soPl+k4mlrOAWH3eW9dk7rLc3QDV2gIXktR37SuLL2oY
 KsE66edztjWXTQZ0I3oILHbZz0Gk2wLj56/V4LDOODlg4R91rG3O51su2FEt4J4awo1aLKoSqDO
 hxj6Q1LT2gWMVQbbzMR1zIAXkoU3emojrfRHXd/OcnwSAaZF0HaziRYfYtlLZ3mKnUOC4
X-Received: by 2002:a05:6122:3c4c:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-5a6e93cc2cemr4173609e0c.12.1780567825155; 
 Thu, 04 Jun 2026 03:10:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4c:b0:56d:451b:e4dd with SMTP id
 71dfb90a1353d-5a6e93cc2cemr4173601e0c.12.1780567824678; 
 Thu, 04 Jun 2026 03:10:24 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6d6413cc1sm4748297e0c.3.2026.06.04.03.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:10:23 -0700 (PDT)
Message-ID: <7a487bf7-6357-4e67-9b84-6ee92878eca8@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:10:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/25] target/riscv/debug: Implement permissive type
 unavailable trigger
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-4-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-4-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a214f11 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KZvdDlZKb8VGcrK-DIkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: OYyJKxbyIsMFmGDQMz5AB6XIQ-W8GH8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NiBTYWx0ZWRfX2y1MxM5fOfe6
 5XBppixT0Mi9U2aH/glv4qOyOct9SvaIAMaIkaGokFv7uwn5qZj7gu1ATPNUuz38oFJAoHGAysm
 X1UfPD9zu0OdaliU7KSHZaOFMXJxuOSzDzNvOCKXRrkwaSJ8ButI0o9Zwru+fzNfGcxdj50DQlH
 7RGHUUBGQ5dMiLTZe8z49J2hzb1+zrH4bTean0Nnl5xvPgnKQZiKr23p4wanfSgS62KICHicswK
 y7Skk90nD2J12idGYJ7OMZlj4uTdbcajmFyBiPJovuY5w0JYAF1HBuUpmBpgMC1K/t5D8zUMuRb
 iO4e9TZzJ+pMko3ICNuPSFQ1+ZlNUti6n5f5ItpsefdOgB1oEuzm2FVIYHwDhs/gdvtDuKlI7sc
 UYyr6m41zZqB3DZXOSbLbpGmOxJsy+fHTvLnkRvqAC4FaBrRRrbCJIbZ2hhpoY4Hbgey/SRq+tb
 N4owBJWmPEzZMyDwNZw==
X-Proofpoint-GUID: OYyJKxbyIsMFmGDQMz5AB6XIQ-W8GH8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040096
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> When a trigger type is "disabled", tdata2 and tdata3 must accept values
> that are valid for some supported trigger type. Additionally, writing 0
> to tdata1 must result in the type becoming "disabled". This is important
> for the prescribed sequences for updating triggers.
> 
> Implement write tdata=0 -> disabled behaviour and permissive accepting
> of tdata2/3 values in disabled state. This implementation could be
> improved by checking tdata2/3 values against supported trigger types,
> but it is good enough to be usable by software.
> 
>  From the RISC-V Debug Specification for tdata1:
> 
>    Writing 0 to this register must result in a trigger that is disabled.
>    If this trigger supports multiple types, then the hardware should
>    disable it by changing type to 15.
> 
> and, when type=15:
> 
>    This trigger is disabled. In this state, tdata2 and tdata3 can be
>    written with any value that is supported for any of the types this
>    trigger implements.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 2190c25f23..c92bd9860e 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -827,6 +827,28 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>       }
>   }
>   
> +static void anytype_reg_write(CPURISCVState *env, target_ulong index,
> +                              int tdata_index, target_ulong val)
> +{
> +    /*
> +     * This should check the value is valid for at least one of the supported
> +     * trigger types.
> +     */
> +    switch (tdata_index) {
> +    case TDATA1:
> +        env->tdata1[env->trigger_cur] = val;
> +        break;
> +    case TDATA2:
> +        env->tdata2[env->trigger_cur] = val;
> +        break;
> +    case TDATA3:
> +        env->tdata3[env->trigger_cur] = val;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>   static int itrigger_get_adjust_count(CPURISCVState *env)
>   {
>       int count = itrigger_get_count(env, env->trigger_cur), executed;
> @@ -883,6 +905,10 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>       }
>   
>       if (tdata_index == TDATA1) {
> +        if (val == 0) {
> +            /* special case, writing 0 results in disabled trigger */
> +            val = build_tdata1(env, TRIGGER_TYPE_UNAVAIL, 0, 0);
> +        }
>           trigger_type = extract_trigger_type(env, val);
>       }
>   
> @@ -897,6 +923,9 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>           itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
>           check_itrigger = true;
>           break;
> +    case TRIGGER_TYPE_UNAVAIL:
> +        anytype_reg_write(env, env->trigger_cur, tdata_index, val);
> +        break;
>       case TRIGGER_TYPE_INT:
>       case TRIGGER_TYPE_EXCP:
>       case TRIGGER_TYPE_EXT_SRC:
> @@ -904,7 +933,6 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>                         trigger_type);
>           break;
>       case TRIGGER_TYPE_NO_EXIST:
> -    case TRIGGER_TYPE_UNAVAIL:
>           qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
>                         trigger_type);
>           break;


