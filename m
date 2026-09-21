Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9006C982E6
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:06:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8efH-0004Mw-BZ; Mon, 21 Sep 2026 10:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8efE-0004Mm-Gz
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:06:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ef9-0006HV-Iq
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:06:36 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LDovCt704279
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w0YHS+iOfcdK0BhGL6ku3jhNOf6vx2ivOXwLoXI4K4M=; b=i+MazzdNVvprjJxC
 iWHGqgyHx0x8QMZnB0OTnFckWKMTWxBBMAEwBUxYkHwVUN4s93cKFoDD3e4P6t5Y
 rPnrHdXgPaHDSHDjqcws0SwrNAMnqfYPEP/ndmMA9y8Mm4dNXUFMm9OBVbqQLkxm
 HqZmPRXjW4RuhfMWTZlxvQJhjCEeuS+GPjML7SRzpPlwP06pbzts5o4h/SNe8NlB
 a20rNgKPxHWxNlUH9W3Lm+vKJJzq+5+6B/1wW1cZMGW96iCrJ97IM8UciZiGAVTq
 Okx3i4S0fSXzXSfr5x7Mh8HXo2wK+jbLUD3U4WSNCJ6Uq3UTQeyE+h/UctHean+S
 lONrXg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1ejs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:06:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97e9e2deaa4so2536626241.1
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789999582; x=1790604382; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=w0YHS+iOfcdK0BhGL6ku3jhNOf6vx2ivOXwLoXI4K4M=;
 b=KadBXZn7VaxU99x4aHdNWtN5TLVFUmsQK4e9uXyhqssp8diGQfoH9OQANbjoI86Ugv
 mt40SUujMtY9Fnvp1Phc48n0mW8BbdoZd5aRC6MAjRhDhJH1zPaoy9zO7HDFonF1NSif
 oguXVRK44F04bDHdXQI8qLg8uL247behI9U4C5SonCwy+cGg7I790e2lLD1a6kPEaEel
 huQANj45oUcTRjsbqsmVnGpzAG2YuXz0MTK68CVOMXZPwN2e0STdC1pvmIH3653I79W/
 A76ISo+h8iE4li2qG0e2x6EWjkkv5m/NPCfSS0Xzu0A2pdMxoCNqu7a9PHATCzyM2v47
 KQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789999582; x=1790604382;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w0YHS+iOfcdK0BhGL6ku3jhNOf6vx2ivOXwLoXI4K4M=;
 b=MjOL+P/oLAfHiuedoVCUHruMEycM6DMMk5zCqayulTP7YYOkFYtyg7yl1xrg7sHwCm
 4o+hKLdywrUuECm7X/FIoZjoilKTV6RnFS9FuD4jbLJj/8g9D0JtALxrhvlU6DTCDPJG
 2EhyWlnOklLCm6ajDXzShd6CHO4f07W3eiWPYrZHJnjHRZTipDogeRqdLL9leNY0zoqJ
 FjWA/i5WdSQL7NBtltigF7QWx8or0Bb52RRtn2LjE1cCNxanbyGGMKPJCZDw8SNvi2SV
 KmfFbpEzoo8qZUYoyt3jTlpE3sWA6Tz8s4tX224KRfyD0aBvbz4vuQji7dAhAHS4BGpM
 UhoQ==
X-Gm-Message-State: AFuF++m69ylg1eVmBHMgYmRYPEv3Qp8Ly9CA0JgzDO1UaCzCoBjSLQS+
 kPQxM4Evo88B1dUzMxjPGYGFkI8bORAzvQroLNMlmDikgxXscp4WpriTECVBzu4QnsoYYg4szP+
 FGzyFZKavihDLnN1MQBLGt2I+u+y4BILK5ABWRmykNYim+t1XQa9mX/injA==
X-Gm-Gg: AYBFou0ORxePwJ3PYg5Dc1OGOCP983NJNVwp88zZ8sAZrGNeyeDIxwbmSYkLhy6dnCq
 gOqLmgIZV0IJ5+Ij7SYKt/S/Z7oV1YwOC9nnb1Xgy5Go8OBMQgzt3ZUzBXELSZYXzFy2fqo7jid
 ZmoXIzcTV3qlXiUG6XFSYWveeo/kKj7yL4GAQRIJ2CzRt5xpE/QO5voAdxRUoiHg4phtWxdsCus
 ekpNML4CKu8+EA4o2tktnmyRFb/P0IQK18jUeGa3Z6f7AnOE+2nngsALspeM/qvF9vMhOgDpRwh
 67sKm3WxAYypuR7CpsK4/IxsjxC26nskyj3TOQECTwFvE1mFWt6RqlRGo+3zOZWiZvhICllv6S1
 Ag/2tKhfD7B3l3/4C7Y8=
X-Received: by 2002:a05:6102:b02:b0:7a1:f7e2:aae2 with SMTP id
 ada2fe7eead31-7a55c888c63mr5227986137.20.1789999582224; 
 Mon, 21 Sep 2026 07:06:22 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:7a1:f7e2:aae2 with SMTP id
 ada2fe7eead31-7a55c888c63mr5227947137.20.1789999581833; 
 Mon, 21 Sep 2026 07:06:21 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0735c9sm229692555e9.6.2026.09.21.07.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:06:20 -0700 (PDT)
Message-ID: <429da31b-e608-4a92-9b44-fe15b37992c8@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] target/riscv: Remove ifdefs in cpu.h
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng>
 <20260918-hw-riscv-cpu-int-v5-2-f98c5a244636@rev.ng>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918-hw-riscv-cpu-int-v5-2-f98c5a244636@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNSBTYWx0ZWRfXyLiNm3pLi1xT
 9IokxOk7zUSL/KPhO+bVuTqMLgMHSPc+hitsgqZ/Cx+wIXj2T/gja9w0+Nr4tXFSXQIIgK4BZQb
 fXFjYNnbeNqA2e8CdIqzQxtaMiAA0gc=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab139de cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qwSPTIykQcsi_0aI6XMA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: OX73ENSIy94qAOfraBmup1daE3FKoO1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNSBTYWx0ZWRfX7ah+aBU5QzLy
 vifuqvamIkBins1mrph7wWowz0DzMvcsn8zRABQOnFkzfCZnRk67hS/PPvzzDoBnJ7D4cZIxdiv
 IG9vMExyMiEtP2cQy8nPFjVMgt7mrd9uuJEAiVfk2rWkFiRrB0paP9yCq1SHd0ec4BGqUbR40BA
 vqLhTGC6YrDyzcIzMicDiT7qNEb/ycd0l06nognvjAd6HZlZpX3mfpsGi2XBEfSlLPeYpFZiBpq
 SptyIvl0nF1SmsOCMa6JwYqfcV3HRLFIQcozT1dbqj0JgTqAL4QizyCHJFCny+REsxnHEHYc3bY
 Utd3BalJ81PwPqcdyv2e9SYlFVnQRWGEsPOEa0DPJeTmYg8uMKkXh8P2a/4+Wf/DMzmpcf+WYOr
 xKRvRCsrnAKCSu46RmoOl/6KGXbxNCsCpMAzcPm8Zh1h080srl3qhzSx+uU/RuVj00+Jzevi426
 kqzZAROSxh7vusin2RA==
X-Proofpoint-ORIG-GUID: OX73ENSIy94qAOfraBmup1daE3FKoO1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210205
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

On 2026-09-18 0:04, Anton Johansson wrote:
> KVM fields of CPURISCVState are now always exposed as CONFIG_KVM cannot
> be used in common code.

^-- one patch

v-- another one?

> riscv_cpu_mxl() is changed to return CPURISCVState::misa_mxl
> unconditionally, as use of target_riscv64() would result in an extra
> load and compare with TargetInfo::target_arch.  We might as well just
> perform a single load.  Likewise, for cpu_recompute_xl(),
> cpu_address_xl(), and riscv_cpu_sxl(), we opt for returning the
> corresponding CPURISCVState field with ifdefs for system mode adding
> extra conditions.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/cpu.h | 36 ++++++++----------------------------
>   1 file changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index aee1dcaaf9..e2e0547eef 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -525,7 +525,6 @@ struct CPUArchState {
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
>   
> -#ifdef CONFIG_KVM
>       /* kvm timer */
>       bool kvm_timer_dirty;
>       uint64_t kvm_timer_time;
> @@ -536,7 +535,6 @@ struct CPUArchState {
>       /* KVM multiprocessor state */
>       uint32_t kvm_mp_state;
>       bool kvm_mp_state_loaded;
> -#endif /* CONFIG_KVM */

Daniel, a possible improvement to have safer kvm code path checked
at compile-time is to convert as an opaque kvm-specific structure
declared in target/riscv/kvm/kvm_riscv.h.

>   };

