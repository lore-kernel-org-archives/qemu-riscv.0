Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E325CD8C85
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wWqMO-0001HV-8m; Tue, 09 Jun 2026 02:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wWqMM-0001H5-OX
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 02:54:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1wWqML-0001Gg-2d
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 02:54:50 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6593wj1Z1061581
 for <qemu-riscv@nongnu.org>; Tue, 9 Jun 2026 06:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Q7lYy+PFax0YtPhprTkGNuknYlHwLujD9zPWMYpQ3+k=; b=L8
 VZ6hDNrGmIa5hGUkoYokrxtFgnmm176hNRatMjWU3BC6uyAGoz5AMKAfHZdlal3T
 e/GUzVVXRWcPBrM/GjXuGxDTIzpPueHiHj/B7CPJaTeh8RdfD0G4mig+ZFmh9Sof
 Hst7tCqFqzWBeumiEkAuO0TYPeO4DjBUJIA48VwiFk2uy+qJTFXLWwz8cJHJHznA
 pAjVupj0yfXCd/cIC8E4bn2QLR52+tfGCUBHe8mtmFwxNbh6zGFlA23TFg8tRVGB
 gF0XPmYeoXpQ71Pwt50JuHhNMncOZLy2j6/CtsdUn6frCNarzQgq2V+vjK0QiGZq
 olt8akoR9RaiHEqADP5A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44wq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 06:54:45 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7efcf6f25bfso40047527b3.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2026 23:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780988084; cv=none;
 d=google.com; s=arc-20240605;
 b=Jd0xd9jWE6u5V1m4pZkW1Wz0btJ/cMSuSzP9W1v2obPgsHdhp7vnwX6JDAYZ4BLaJD
 dOyQpWgh/BBZaXpM6thy91dd+0HIJIVYKMb4lq7vZMHPE/HsyDBlZ0PysccJPeXccfw1
 n5z3eIOZ+kcwXbmYuzTKr+KHdu/B4wTnbzJ6nHGMDXDUqOQCJvA1TegOFQ6fRjLTaOw5
 XTmsZHRZXz1cithiF6WtQ0sqfzWTmh+LdPCeMqjKPEDchxlhlw6FTi8UvXtS2ECxnIe1
 XqKxImVrZK2MmKp/sY/iKSEiK3NsIAeaGoy1D2VwGm4ephyleAnyyTgoe+eWWXIsIPxe
 S1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Q7lYy+PFax0YtPhprTkGNuknYlHwLujD9zPWMYpQ3+k=;
 fh=VDZlBQdim74nD5m+S/QyhDPq3XGdrcg9ccNVxDQwchE=;
 b=DSxOzla/aw5Gyqko57yshPaER72ARCh1Fzsof+TefPmM7S1K8X0JoY1gcGx/w1ZeOY
 +OUrVwzxO4A8kUnpdJwYJnaBu5kbaEIjIq9IW0NjcplfZ0AqAQa/WgvXna4jVEtG1Ewc
 8J/lneDbYzf/Ssek4DA0U6iPzoXUyHffB9vkLPhCGtpgdJ4I6PHVPqNrDH+nFlverzSZ
 vNhZb2lxSnJUQiKQzzFPqdfJJAQcyFjsZ+LtyA1kOkRI765q++YjK3rmU4uKPa5VX861
 D3LAN77HnYz0ot/PZT4c4F/etAQA2yfXTFLzyR1pFLrfMW3sYEn8YreE7hZm+WYonfpO
 oTXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780988084; x=1781592884; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q7lYy+PFax0YtPhprTkGNuknYlHwLujD9zPWMYpQ3+k=;
 b=MQ4+3BufG0b8tzNJYayNISzzfb1xDw0ZzwlvDRAZ4PNyRl75DjS/tATO3+iPe71J0p
 ptpWs75Oi/QFlTU+7zA7rOiVN5JeYnm6qrhLj06MQCjOCWKMx6G7AL7oG96i1G2ddImC
 0ThNOYU1SuAQaX305UGo2sVfhg+GnPi8kLOHNYavrugwhKb31CeSfU28zYmvr8SklBnY
 5nTrYj8tqPCRBBzFhRk3a3T1ObpOFhah96pGu5Ny5b75Q9S8BaMS0INzTWAfA4qJSJuA
 RT2Yv+hQqe6J3F0Pp4sydtd4iAEvFfjw+4QtQHaqQpEWI5S3wl9Z5OiNYt5fvbgrngxl
 CTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780988084; x=1781592884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7lYy+PFax0YtPhprTkGNuknYlHwLujD9zPWMYpQ3+k=;
 b=bwxtRim8vUIfn2npNfpI2aFy6QzYxxHaC/PMEg7PrW4gQr9wmm+zfNkGNbvLwrbp5g
 Q4nVnwoX+8ARkNOsoSXnYHh74zqMWl8w3U77/uZy8p0eCT5oqowmT6FaczeJTFvKdrMv
 vf1DKHEW5XjVrkFRg+ys6SWl8PNBeFnh9KUUm1UcUjlswpqqwWXxAYSMKNIf9oHMoaoE
 GUNvlfuYx7O5vjlHeKrh6nkHkunuw76oXw0IoBaaRd7Qpe70hq3T7sjjVjd0He+n5MIC
 VIReh5dDreQg+pBCOgGYldsoZSiJnmRuUkbHaLKm71VtbXDlZXVUEKDyVacJ2sBov8Fs
 zqqQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yWSRfPlCgZ/TKYH5FAakKTSbQoodx8wPmsIQxRvy44Myjb69dFoT+Z+h0QupZJ/UfUZNQxz5SzD2H@nongnu.org
X-Gm-Message-State: AOJu0Yyt6LN2pHA1/ZFUj2ZeC/IGdOUL/4WZkAlpoDfGrDWd2rh7ITVd
 DjZt7im6UlZS+LeR2tUch6dGAyHT25OHDXzQbTbNc8ekUjuX5AhMRB1H0nJ4x1FsFDe+ZWKHr21
 uqy/VRR0t77yw9eyGY5OGQHfV3CabUBAWZnmDqgRtAbAwJwsuTIYwy7CFGKzY/kBcmnNTLVTIIv
 fHZJQ17015z3Fd+PVE4geU8Nz2QFx8Vt+u
X-Gm-Gg: Acq92OEPB3/ExYnu5mLIcqqPn/3H2L2agzeRoXXlt+nYgxmW+8dp6n1I90yBDHkpn4L
 aNwNI9ffGOimSdD5c3SZ8YihbenMGJ9N8zEs1lA14oeH/hKymKDKGoZ9f60NTu3UvJOHA+MEgFo
 mIGhjL/tammW5wM7jxuvUy8dtewomZA5PUR8OId049n9Xoqr26tNCYFM4piwaFQCyEzr/q1nD8Z
 /ljOzN+OMqazq6GTA==
X-Received: by 2002:a05:690c:7648:b0:7ef:dfa0:c6ac with SMTP id
 00721157ae682-7efdfa0d347mr80056587b3.2.1780988084670; 
 Mon, 08 Jun 2026 23:54:44 -0700 (PDT)
X-Received: by 2002:a05:690c:7648:b0:7ef:dfa0:c6ac with SMTP id
 00721157ae682-7efdfa0d347mr80056437b3.2.1780988084255; Mon, 08 Jun 2026
 23:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260604120017.398890-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260604120017.398890-1-qingwei.hu@bytedance.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:24:33 +0530
X-Gm-Features: AVVi8CdPiHv0BKKk7wTIrjDjopcoA7oip53qUT0EuNV6sQoDEYhKmFxQU_syScs
Message-ID: <CAB19ukHpaUSJ_qMrO4DiUX6rioeoOT4h_=UHUgjsgecK7F1+7A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt-acpi-build: Fix RINTC PLIC context ID for
 KVM
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX0IudknF/j+th
 cq4g6te7GVpslVXvrNB7ClxzuZFWrlWk2uRHiDy6p6JOcStWeGYXpeKYFS+z+bwLPEHI4d9s4ZT
 1DBpoo+7lSip/Drt+0OwHZV3NFM4Su9PeqESiBUAfadlqY++ok77ePVj/1f70ykS9Xmf35n6p08
 Qe54ws406uQDBZ/aZAo2355ULITfhM23v6D4bTYRjFfp6G8JOzXebqeXws5eeN+yJTWRK0q2xIr
 3LbGR1MmzHSdrq3H2UhIizsGJgjRTIr/fEItna+raqYjhPRcpgw2p1MUbizVcw64UflosUBvekO
 1g2JsJWa7SnpHyh+mBcw4Lkk3krj6hglxR+VrVJLnRIzjqZoQ+0Gfr7caTjKXHRZkwq/gKVc4kn
 vusJ04cSaI4653ShBfdRgtuamf+fr4/FiAZWh+lS1LxkLEnW+L6NEfpqam7UCe7JF9EVOFnLqgP
 HGe7jc28BDDodp3NT9Q==
X-Proofpoint-ORIG-GUID: mX2No5-lbQlf0OQGTKRZtmDi6VRN6R_h
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27b8b5 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8
 a=UUqIJvGwmf8YkP_u_ZAA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: mX2No5-lbQlf0OQGTKRZtmDi6VRN6R_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090063
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 4, 2026 at 6:14=E2=80=AFPM Qingwei Hu <qingwei.hu@bytedance.com=
> wrote:
>
> Each RISC-V MADT RINTC entry contains an External Interrupt Controller
> ID field. On the virt machine without AIA, this field identifies the
> S-mode PLIC context associated with the hart.
>
> TCG virt has both M-mode and S-mode PLIC contexts, so the S-mode context
> ID is odd and 2 * local_cpu_id + 1 is correct. KVM virt exposes only
> S-mode PLIC contexts, and those contexts are numbered contiguously from
> 0. Reporting the TCG context ID for KVM makes the guest enable a
> different PLIC context from the one used by QEMU.
>
> With ACPI enabled, this can leave PCI INTx interrupts pending in QEMU
> while the guest-programmed PLIC context remains disabled. A virtio-blk
> root disk can then stall during boot because its first interrupt is never
> delivered.
>
> Use local_cpu_id for KVM and keep the existing odd S-mode context ID for
> TCG.
>
> Fixes: d641da6ed43 ("hw/riscv/virt-acpi-build.c: Add PLIC in MADT")
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  hw/riscv/virt-acpi-build.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 413d47d70e..6b06d9aa87 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -100,6 +100,8 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
>          build_append_int_noprefix(entry,
>                                    ACPI_BUILD_INTC_ID(
>                                        arch_ids->cpus[uid].props.node_id,
> +                                      kvm_enabled() ?
> +                                      local_cpu_id :
>                                        2 * local_cpu_id + 1),
>                                    4);
>      } else {
> --
>
LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

