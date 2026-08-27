Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E134C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzZ49-0003EB-V2; Thu, 27 Aug 2026 08:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZ49-0003Dm-05
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:18:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZ45-0001uL-V7
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:18:44 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RCCCFU3803279
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vM9WXoZspk+rVM2C8FVQGX0VGwXrzjayBRNIarztBRQ=; b=ndAnL8XVpSp9aN00
 L2fAnJCId8fsFjhqYnYfbMrKWY76cJ3t0nACa/9GYRZR19h0yGFGY3u3UCbZJiEu
 IcwVFA2Q9rN0ad32Y+W7Z3EZYa8d287pbf56I6ng3Alvim8VjIjBhyzauPoJWM48
 fN/rrCIl60ny2Sg9TRm6Y2VLbFh8rSnGwW2xzMyzrel0bRMcoxMlg4vGdSubEOkN
 S8dXG1Or4I0l+Hwy+bKDwVhy7x9g4i/Lwi5+VQrUqM9urxRgzZcv3pi5yPkHoch0
 cFazXM530H0xLsCQ3KfS/1UCoPrLq0VlL250+6fz86xIVmpQOpViwXhfkhE3z4Hi
 PHHI6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak560e9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:18:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934963b2bc0so164645185a.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787833119; x=1788437919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vM9WXoZspk+rVM2C8FVQGX0VGwXrzjayBRNIarztBRQ=;
 b=H+X8RCs3aEiKgaVwjOGwgSoZ/2AAG+qYoKHV3g/aZyBbzMcW4J+IB6PT05R03uHwlB
 gKedaxlV96ZqzzRxGXz5dFe+jQybWIdrmbOy2nYclCK4QYfXEVPvjI2TDvfKmniku//p
 uRYRZb/Z+37vR658X+6+qRFu3rYU0L9S/3kw6ElEcMSmQEj0qoIGH9Ct0QmfItg+HBaq
 95p8UkIoe4r8HolOpCekiIcoXHHsetpbmQ3olZpH/syS+Xv5qfOEjL9aMxbgi7+sgbtF
 oaeXugTkYTCjFpWuBhh0TT8oHOwMLB7po0Ft2/aZl0Hf0x+JjST2NdG4hi86FpvR9MZL
 SzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787833119; x=1788437919;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vM9WXoZspk+rVM2C8FVQGX0VGwXrzjayBRNIarztBRQ=;
 b=ZWpPttNplX6VnO6qOLrKR0bb4ypyPik7Qd2u16Q/i8Z4vq7eevQIqyLZQ4uiK87LE9
 V1QT0ydmk4nVgtnfP9GvDU5ShQxRoxFTnHKJXuay5oT/aK5ebFte2ajeihzTE5eYP9vt
 i8X8OWcfxS7CV/z8BqSoM2QlnCZVwFqJjGS8ZASkvulcTcGoN8di1+5eDWOyBn/ooLtB
 D6CKgC9xqS/UUs8/POEZfOLAZcgsyjAomgWZd1/CJvEa4aesYlUcWoMYdelUitnQ+Z1I
 p5EKEIN/l5UO8iNr1YNWhHHYDLuq9/iYaizuIY4P6Lg7RCeIAnINMyoi96qLjOrs9WSB
 K7kw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp67+xqIDW6TumXQzhJLhphmoC4ra5dVTZK6o7Pp3rMkF/yyYhNRqfpj9tlWEXXT1bnNm21ePJn9hWT@nongnu.org
X-Gm-Message-State: AFuF++nQwOBP7bY5JyodZB86Ozr7Fuem5k9U7t3GaQ2cDXVYImF9k7Nt
 RMUX3WuKncGNrLotDoA3Sv/EFxi6ieXKm7W4IMjCIuLqbwxgr8x0JShHNeIJHMiKnuxUiP8ka59
 1oVPbJ+FmcOUpFlQoH4Icy0pwcelMySDFtXeYdb0YQ/wX6ZFBGcxE0q1xrw==
X-Gm-Gg: AR+sD10o3kLGwlgAajwHYubi70XpmDAytJuWJBJNbCzJ4OzF4LJ2lwXAxt3cGwkgfMu
 818G42bToCQ/tknpa01RJf1oxIF59slt4A8HbBIxQ0kypudCEIhrasS+YJH/dVG9hHLE1X2gsO9
 D6GG8zMIPthzCuasAl8ksG09WYK+NH0dM6F1RMOMi98sQuGLFmzp1OlpG9MgLmbnfABdBimq9BY
 wH8T+DZSUJ5U6iiEghzTF7T4fphmBpqMxgs7Q78/j0eM3YPA1dvA/Li+yzvRSAJpDwHak7IUZ4E
 hSn2oWiAFwehF/Py0X91lNVNBorzmO63vX1QJjfcsd02OUkoEbjgupg7zkjMFtmTqCwzyBqFo2B
 j6Rj/X8X1jr2BBcsSe+cva3wqXgBy1hd1dO/n
X-Received: by 2002:a05:620a:7004:b0:938:39e7:725 with SMTP id
 af79cd13be357-93839e714bbmr906020885a.32.1787833119384; 
 Thu, 27 Aug 2026 05:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:938:39e7:725 with SMTP id
 af79cd13be357-93839e714bbmr906012685a.32.1787833118769; 
 Thu, 27 Aug 2026 05:18:38 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e616ed0sm428855285a.25.2026.08.27.05.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 05:18:38 -0700 (PDT)
Message-ID: <be675569-27ef-46cf-82bf-563852bbe66e@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:18:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] hw/riscv: Add property to hart to allow private
 memory
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Portia Stephens <portias@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
 <20260826221154.54577-6-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826221154.54577-6-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwMSBTYWx0ZWRfX6sUY1lrJGv9b
 TYxoihgl0u+CrNbI1Xm4nJfjEcKNbUWx1tWY2+c5Hc5eLCzghfBJFGbE3SR1OpkTSr233cDyZZs
 WSRaHgJwgbg1HBCeGSBuEF9ZjkkdOFY=
X-Proofpoint-ORIG-GUID: LYDIBCOSgt4A49cHxNU7r0hzC0KxnGhp
X-Proofpoint-GUID: LYDIBCOSgt4A49cHxNU7r0hzC0KxnGhp
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a902b20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=fl7gSUuWqnDtph2dS9IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwMSBTYWx0ZWRfX25HA+HM7DXsZ
 fISapRtjTy3HUq4sMQpsmu9+2jav5MfL7rxXhBu7EgYUGHJpiuUG6YXGg96U+hVwU0Vn8Yj+aEM
 5WQq6BqO2YYhEYrZJKKsfKgpV6F0SimvEGW0xdvuFkKLLieqh+AhezcS82TJXvKqO+GFOnaEkpc
 74XPC68fca67sRbEUrTPYTxTnEfPk9DDHRLR9qGnNFAbbj8KiHstJQqxFOvVIF/uDarF5Bt99Da
 dyASjrs7KRMX5IJejSqOneHw+Vuu6EVgTzDFdDERwjM9yFUjfj9nQWevDxkju8X7zC5z6NJCOiE
 1rjko49dk7y/DhJs+PL/Uf5atW7l5PO44Eg2tAN6xZ/fCESTPmKrqYCa9l82RLESFojywTgPxrw
 VR/qwzSiGLaxpIdaLdiwnFn7fNOYnCfbzo3QtZbKwo0QcpPhCuPB6yhYITxtKjq8Ql4i6HRwknZ
 sRo+GRtMs5AqoD4V9sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270101
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



On 8/26/2026 7:11 PM, Joel Stanley wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> There are platforms where CPUs have different mapping of system memory.
> The global system memory does not allow for this. This adds an optional
> property to assign a specific memory region to a hart. This allows for a
> machine to alias the hart's memory to system memory while the hart only
> views memory from its own memory region.

LGTM but please clarify in the commit msg that the memory region is being
assigned to the hart array, not "to a hart".  A hart is a single hardware
thread.

E.g.:

"(...) This adds an optional property to assign a specific memory region to the
  hart array. This allows for a machine to alias the array's memory to
  system memory while the array only views memory from its own memory region."


With the commit msg change:

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/riscv_hart.h | 2 ++
>   hw/riscv/riscv_hart.c         | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index 197fa1623115..c3cd05a2c877 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -42,6 +42,8 @@ struct RISCVHartArrayState {
>       uint64_t *rnmi_irqvec;
>       uint32_t num_rnmi_excpvec;
>       uint64_t *rnmi_excpvec;
> +    /* Optional private memory region for use instead of system memory */
> +    MemoryRegion *memory;
>       RISCVCPU *harts;
>   };
>   
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 747754be6158..32fd39737ff6 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -53,6 +53,8 @@ static const Property riscv_harts_props[] = {
>       DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
>                         num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
>                         uint64_t),
> +    DEFINE_PROP_LINK("memory", RISCVHartArrayState, memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>   };
>   
>   static void riscv_harts_cpu_reset(void *opaque)
> @@ -117,6 +119,12 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>       object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
>       qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
>   
> +    /* Use private memory instead of system_memory if provided */
> +    if (s->memory) {
> +        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
> +                                 OBJECT(s->memory), &error_abort);
> +    }
> +
>       if (s->harts[idx].cfg.ext_smrnmi) {
>           if (idx < s->num_rnmi_irqvec) {
>               qdev_prop_set_uint64(DEVICE(&s->harts[idx]),


