Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56383CD6E75
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 18:46:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVD51-0003HT-LH; Thu, 04 Jun 2026 14:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVD4z-0003FU-UZ
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 14:46:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVD4y-0005Qe-8i
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 14:46:09 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654Ekc5Q1132194
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 18:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5Z90JxGA2J2Cg/jStNjAioFf
 q+A+pJAGttKcxd4114U=; b=GZCyszeh6fX2L9Lm339A2YlvcfTm6jl/fKJHG9FZ
 xVGabVtxguwM8it1u9inOwJV/QC7dUY/z+IlEyOhBHW6fYMGciTrRbJfAymAQ3zo
 t30yGtVsLVFRtChR1GzgrEcHoDICrCbnfTfifaliI+JJOpy2ZNfzPi3CbSA+FfmT
 A28UcOVTXVO5uyQO3r1/YWagb9bPZ/IEpacQjgQCWNeilyWIEBWIekmtf27wEcJx
 KfnPjxeWKQRgSh5ZLVkI2wc3rI5PcSvmmPF6JKoNnS49u3nV4OyK9TpwEruD1FKf
 i15v9l2nTvBUOWI+i/NNfxpBajDdJBn4IgUAT3fGbrkkZA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsjpye-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 18:46:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304e4636205so425392eec.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780598764; x=1781203564; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Z90JxGA2J2Cg/jStNjAioFfq+A+pJAGttKcxd4114U=;
 b=fEosVnZ15mJ3FaiA1wT45cYlgkjxqFLh5/rXYvnfKMxAClZ4th0mrOiQ9Ig65SSb36
 MItdnSAjKQmIc9vfIEnJjYVbQQ2KHfPFtmkcp4jCHxaSofMmETlDlkLgCmqu/bQGcHCC
 A4BhdZKnmjKMQ2RQmq3tEh3NzLHND7k76CrRGDVg3ib6YJ2UfKUzHWMt1QtFEVQB/S9A
 qv76ZGKyk89a2ph+bR1iRtbxjkWICJXiYYBD66E4eXpcKFR7yqQHkvXp0pcjZ1l9fhaT
 eZjwZc/eRVjXKVBMJ/NUlfdLawzwCUt9mXj3CdVQ1TvNvnDdu4v/Tl0jxa0SNRymc2Ln
 2GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780598764; x=1781203564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Z90JxGA2J2Cg/jStNjAioFfq+A+pJAGttKcxd4114U=;
 b=drM5b2IGfM5/I/GivnVpJstmfawRDVQBR5ng/nufWHj1lqi+TN5OmiHmlPCQ0Dj3jN
 KS+FZ8bGI5rB76HzRyiC7RVR7pfa6+MabOy4RVyofD6Q//6KqAlPEfxIFpzB81VfIB4f
 TnrcV7ZFYm/3ITZ4Dti7gKlLADx7yu8F7sFSCa9YVsoFuuu7RpTKrDn71/opMyZcsYK2
 iRgDOnfL5b4O23HYtZae8CdD0ot2zgUBcoyHcFtWOfI5vzZ3OiSyHxnpKIeRQ6h73JFQ
 +hp7Pnm2TK0sYCaQ7GOlu5fR6Uya6CnsBeZKF1AFbWhAyLjW/GPwtEg7TZo6EvOJCbzZ
 ATiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KsqTyqUEYOxxxb9EoX3t0K1DlgkFey7Br0ZMkb5RaYLbldlD5Sd0ZzE11PCzRnF5XcBCuMkjG8Nv8@nongnu.org
X-Gm-Message-State: AOJu0Yx0crfuTyWjDd8QMvmvRbT2nBYtjcHJJY5fI3d6OPQF5gteDMGK
 5RZl2m8if46ewOYqidXTK8cKflGd/cw7YDrGPG03vAmY+xR7Jb7ro5O4plycdoDt443g3qIq4QQ
 luJUPllQhyvZZ1DC4UYpVDjGO0+Qi///mN7hF/WsPU9Iqt/+SzUUjcxVhcA==
X-Gm-Gg: Acq92OE5smFarXhRYFRVfmyz6h4IkffBMTDUBgTVF5KIrN/WaQ/NeeelXivBJZBYz3B
 gg8zHWg1tk452qypURyTve6oqHq8+K2F1VJi2H8fyayqgYUG+e3FtGQGJqQmqguCVqyZ4lops11
 tVXFKYErvi8Fm9KvSg6ezAkhH24WxiDzJavpaoTZm79nYWT08KzOywDykTthfvsJAJ1EYNvN+ko
 kQvNtxkj2F4KNPxDyAB0T5z034XdpcPMx1km7dn6Jnv8A7P16orLhSz4Rz/diyb1C0Iwcly6qTX
 qy4/rrUWxILAXD/gR/MCTOYrm2bgYVu/Q3RZjyPNBogd64/hfuB+HCi/PEdG+PjHwnaqmaxe2uQ
 uoBkBmaC4mzbEzUemky4PY4V5GZsP2yhWOtEtD91DAg==
X-Received: by 2002:a05:7300:df49:b0:304:d75b:f5f4 with SMTP id
 5a478bee46e88-3077b1e192cmr880eec.16.1780598764169; 
 Thu, 04 Jun 2026 11:46:04 -0700 (PDT)
X-Received: by 2002:a05:7300:df49:b0:304:d75b:f5f4 with SMTP id
 5a478bee46e88-3077b1e192cmr849eec.16.1780598763517; 
 Thu, 04 Jun 2026 11:46:03 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df191d0sm8442479eec.21.2026.06.04.11.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 11:46:03 -0700 (PDT)
Date: Thu, 4 Jun 2026 13:46:01 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, leif.lindholm@oss.qualcomm.com,
 Fei Wu <wu.fei9@sanechips.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
Message-ID: <6kmy2hoeph24psgn5cdtkb56djgtlth42itwgetcbcoesxi4im@275pvrh4qjhu>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
X-Proofpoint-GUID: g0oOD3W7PB65BysRVqJTsS3Bs-CTI2oS
X-Proofpoint-ORIG-GUID: g0oOD3W7PB65BysRVqJTsS3Bs-CTI2oS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE4MyBTYWx0ZWRfX4675IDyz3JC+
 7cxKNMb25Bol8PZoXmQh3kmzvtvAmJvTt0LgKCguLnNBw0uulzjtGe2zT6N7liPT6qZLgQDsrnh
 Y/Pltavx12SrjDZ6cF/XB9DJt66ofghBAF9OeymI+wnJL5Ta1bBW9fudsZV8AFkVoCr7MdhENpb
 8MVsd0u+fK+FpQgWYJfjavw9SKZt7DRB1c51FHvE+oCRMJ8zNWcRsZpnlnvYmKUlHiDJ4zvtv6v
 VPqsYUZVlhuXxsSj41IkEJvsoozWUkDeLKPk1/J5vVRlAibqQKwEE4SGTeAnPvqbbt4o152uXsO
 gSQlNKJFWUejyRFp907PVxrpoe2+fIDOzwwZrUnrEl17OF4v020MsxFLWKZI+o6Jp0FykSd3Gr9
 W0UQazGl7G9a9i6RXW4+vEWU+YA3a78CQKlNYBGTNW6djrY7bVZxuMtWhd1ycb7C+NmyGp76WCY
 POOTtFDVV7M5y8lE8Cg==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21c7ed cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V1jnuoLLAAAA:20 a=uTRCLKPYAAAA:8 a=EUspDBNiAAAA:8 a=_IAod1NrByNiMFFobFoA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=T-agBWn15iSmxapsA1lH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040183
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Thu, Jun 04, 2026 at 06:52:41AM -0300, Daniel Henrique Barboza wrote:
> From: Fei Wu <wu.fei9@sanechips.com.cn>
> 
> The harts requirements of RISC-V server platform [1] require RVA23 ISA
> profile support and others.
> 
> This patch provides a new "riscv-server-ref" CPU to go along with the
> future "riscv-server-ref" board.
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
> 
> Signed-off-by: Fei Wu <wu.fei9@sanechips.com.cn>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 30dcdcfaae..a150acd151 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -42,6 +42,7 @@
>  #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>  #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
> +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3f0f931335..c4a5a7f1cb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3315,6 +3315,17 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>  #endif
>      ),
>  
> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
> +        .misa_mxl_max = MXL_RV64,
> +        .profile = &RVA23S64,
> +
> +        .cfg.ext_zkr = true,
> +        .cfg.ext_svadu = true,

Svadu isn't required. It's only a 'SHOULD' in the spec. We should remove
it.

What about Sdtrig, Ssccfg, Ssstrict, Ssaia?

Thanks,
drew

> +        .cfg.ext_sdext = true,
> +
> +        .cfg.max_satp_mode = VM_1_10_SV48,
> +    ),
> +
>  #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>          .cfg.max_satp_mode = VM_1_10_SV57,
> -- 
> 2.43.0
> 

