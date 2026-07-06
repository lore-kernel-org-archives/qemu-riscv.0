Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B43BC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 04:13:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgaiE-0008Du-Fn; Mon, 06 Jul 2026 00:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgaiD-0008De-3D
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:13:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgaiB-0008Nw-7R
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:13:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so4707076a12.3
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 21:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783311218; cv=none;
 d=google.com; s=arc-20260327;
 b=GxnRyC61e0xbcSjNC5ZJKa/LIfsMbY1MP0anNy2pVn4VZw9wdQQZK+QmKbDErojkCH
 o0QsI7D7H4sFDOklMyx2c2uO/la96o1DofK0/CLtXS5t9dwJ27hV7zb6OB4uSw7FTvsb
 CG03CmrwELBf0IMFX0AgGl56RivNlAlv2Ws9grHXhcnu5a/myvhzVKVQVXidLutm0k+R
 F1OxfxcTBwvaY0w3uFzvjON6p3Q+Nmn8kjGgAe26wBP0t//P/Fi321cfGYSYghOvYzBI
 Xv8OcPSuB6/u+6kSWNV+47CShIigTWJ2zQzDnLa3g2XjWm1LmPk9C67m0uapDYLzywaa
 hlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sATuXxprBdPcwRNXmrAzxvCj8IuCwss2kxcHcmpfN5A=;
 fh=ruMzvlU5t5LKWFc96Ko4MR08RM8w4k6QNSfIQ0ii6JI=;
 b=Rbnad47a1bAl1HIsnmX3OPVBf5I98xob7zsC9jrAkNEGjqh6iEkrSvq034kH22Kcy0
 Yffs6A5CDq/zh4m1J5g8/8/vXN7tBlkHeY3Jmad7wJ2zq8PaxQi4nW42nhJvvF9r6z2A
 s0WpY6xnzytoirZV+9bVHo1XAY0Rhw2aF6NTpbNKrwZ/QCcKJ3YWHDTzO4c5L5MlLa6l
 x+yh6AEc++drxd81PDZ9x0PEZ50eUGqbg04l32GvGRF5PhiQ8d7TjgPgYgiIXfgKDX2v
 e+2eyQ5ni0jt0XnzuheAZydUEzjxg8o8RtTruHnjRfOBdiRW9wPwafxjpfBTcS5Fa9zK
 NtNA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783311218; x=1783916018; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sATuXxprBdPcwRNXmrAzxvCj8IuCwss2kxcHcmpfN5A=;
 b=W7gbcyww9mQO4+9V7QnBHDAVkSLVRiFotzQM2z1uRyaqYzgp72ED9pHL66nESl+xvF
 I1jU4Vsp7kcctH1jJ8W3Vm28sipCSn5Nzj6YPpBCcbv7P4NlTQtkrQmjHInMHYO4hutd
 Ls0mmKIxhLm8jGnfaSlAPJrEPk848y2a74CMS0dZRDZTQaRxy0lz5c3O7YYGiYD+aggt
 EgS7A7SYvgQo7dF2dE4ofSQUjEOf6Zy7Rdziu8PH5HWC4O5IkA/aEMXUgi/UASnmi7kE
 MKdzJVfoqLCGlEAUM6X2Ldw8mIkazr1RAkC+TWMpZeuM4y7vdEQbyo9PwZr+TPY5fYcr
 xDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783311218; x=1783916018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sATuXxprBdPcwRNXmrAzxvCj8IuCwss2kxcHcmpfN5A=;
 b=DvdNS8G3tFo5de6qJDUAybezS5qjJPg77Zh4SjSruMMMwn1pe3pdeCtfY4J5Yg8cdy
 WbIkF5rVoMTe0UZJ5q1+hrr6tAdESxjy3gE2fMEi7cuPcvmXNLISpKWgZ6tuKIYjeIjr
 pTjD7LNhzo90iiO2ijQfjQP9Y1lHsE8GxkFqTboNQCowZxBe8BLzRVR2Amoy5vQ8XSgx
 Il1H65M+RmTmu1ttD8MfBsmQ/G2eh7LFJ5arhQ/wqRRssDZDkWm0ixK170BE11nAJdld
 zaMeO+wYBd2XQMPStv2IkYk+NFEL+z+23nesSC2sE3HZCKbKCw3Yvo+c2r5uaeSobG/I
 ZJeg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0Z4KNJoO7C5HceKBo+h3WwQXGew7/uHarVWtlPuU4Ocr/4lczWnRkHT90jTj58V+yKSgkwFXbT3tb@nongnu.org
X-Gm-Message-State: AOJu0YxBVogLv1twjtmVr9FqC1ul2VwmOVWFNLCCn6m+Z7VPFJZQIsL4
 9C6z6o37rAeh3N73szKLC+8ULPylaRRy91tR7+3ZacMTqWJO9KFWxgiYLmyLnbYRxc9ttIRvkGv
 Q5zjZxgBj52Jv7V2fGF7YfJZBa7WAOkY=
X-Gm-Gg: AfdE7clMUk80QCyrJ6Eco6KKvBARNl6Fs3+oHfKD1N7dwbsVLh4RVDB4zR8Xa7r4wxD
 UpT+bQbsYvg5W52ALnXsPV87TwpH8JAF2cCfVzhCmQDaB0chINxBtCqE1ZjLCBGU6FT9xRfXrkO
 fZFrANHFM07RmMOrqTBM/eyteE6tvBCAjlKfTU3fWoo3pEPnSMSLbNltdgoPCvizfBmhgcEPfIP
 PH6gb4FUzWVz7cC1HIIsbnqiC5sRc66ozRr5BHIS6zJl/1PXOmb33w+6tV9y9HGWVAHmT4h2AHK
 7ys8uarAt5Oxt6gKmWcchBFK0cwx+/pY5egiGw==
X-Received: by 2002:a05:6402:4489:b0:698:3b7c:7e42 with SMTP id
 4fb4d7f45d1cf-69a1a3ba0cfmr2879971a12.34.1783311217584; Sun, 05 Jul 2026
 21:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 14:13:11 +1000
X-Gm-Features: AVVi8CdJc2aezC2057AV0lDmLvCNO2MP8v2URijod0e1Ci73sHoDjNrAk79nh4E
Message-ID: <CAKmqyKOSHDeN+oC9ewTHmEh1tZ-mrDn_qn6mqZ=CQu1S=5aa4A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set ftype and iova in
 riscv_iommu_ctx()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Jul 1, 2026 at 7:23=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're hardcoding faulting type as READ, where it could very well be a
> write access, and we're not recording the faulting addr/iova.
>
> A note was added in the fault_type logic because I wasn't able to
> trivially handle a probable code repeitition it in this same patch.
> Something to do in a later date.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3564
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 70eede3f14..690c21289f 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1330,6 +1330,7 @@ static void riscv_iommu_ctx_inval(RISCVIOMMUState *=
s, GHFunc func,
>  /* Find or allocate translation context for a given {device_id, process_=
id} */
>  static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
>                                            unsigned devid, unsigned proce=
ss_id,
> +                                          IOMMUAccessFlags perm, uint64_=
t iova,
>                                            void **ref)
>  {
>      GHashTable *ctx_cache;
> @@ -1339,6 +1340,7 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMM=
UState *s,
>          .process_id =3D process_id,
>      };
>      unsigned mode =3D get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
> +    uint32_t fault_type;
>
>      ctx_cache =3D g_hash_table_ref(s->ctx_cache);
>
> @@ -1381,8 +1383,21 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOM=
MUState *s,
>      g_hash_table_unref(ctx_cache);
>      *ref =3D NULL;
>
> -    riscv_iommu_report_fault(s, ctx, RISCV_IOMMU_FQ_TTYPE_UADDR_RD,
> -                             fault, !!process_id, 0, 0);
> +    /*
> +     * TODO: (1) do we need to distinguish other fault types
> +     * for ctx fetching and (2) evaluate putting the 'fault_type'
> +     * logic inside riscv_iommu_report_fault() - there's at
> +     * least one other place (end of riscv_iommu_translate())
> +     * that does something similar.
> +     */
> +    if (perm & IOMMU_RO) {
> +        fault_type =3D RISCV_IOMMU_FQ_TTYPE_UADDR_RD;
> +    } else {
> +        fault_type =3D RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
> +    }
> +
> +    riscv_iommu_report_fault(s, ctx, fault_type, fault,
> +                             !!process_id, iova, 0);
>
>      g_free(ctx);
>      return NULL;
> @@ -2128,6 +2143,8 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState=
 *s)
>      uint64_t ctrl =3D riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_TR_REQ_CT=
L);
>      unsigned devid =3D get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_DID);
>      unsigned pid =3D get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_PID);
> +    IOMMUAccessFlags perm =3D ctrl & RISCV_IOMMU_TR_REQ_CTL_NW
> +                            ? IOMMU_RO : IOMMU_RW;
>      RISCVIOMMUContext *ctx;
>      void *ref;
>
> @@ -2135,7 +2152,7 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState=
 *s)
>          return;
>      }
>
> -    ctx =3D riscv_iommu_ctx(s, devid, pid, &ref);
> +    ctx =3D riscv_iommu_ctx(s, devid, pid, perm, iova, &ref);
>      if (ctx =3D=3D NULL) {
>          riscv_iommu_reg_set64(s, RISCV_IOMMU_REG_TR_RESPONSE,
>                                   RISCV_IOMMU_TR_RESPONSE_FAULT |
> @@ -2143,7 +2160,7 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState=
 *s)
>      } else {
>          IOMMUTLBEntry iotlb =3D {
>              .iova =3D iova,
> -            .perm =3D ctrl & RISCV_IOMMU_TR_REQ_CTL_NW ? IOMMU_RO : IOMM=
U_RW,
> +            .perm =3D perm,
>              .addr_mask =3D ~0,
>              .target_as =3D NULL,
>          };
> @@ -2482,7 +2499,7 @@ static MemTxResult riscv_iommu_trap_write(void *opa=
que, hwaddr addr,
>      /* FIXME: PCIe bus remapping for attached endpoints. */
>      devid |=3D s->bus << 8;
>
> -    ctx =3D riscv_iommu_ctx(s, devid, 0, &ref);
> +    ctx =3D riscv_iommu_ctx(s, devid, 0, IOMMU_RW, addr, &ref);
>      if (ctx =3D=3D NULL) {
>          res =3D MEMTX_ACCESS_ERROR;
>      } else {
> @@ -2784,7 +2801,7 @@ static IOMMUTLBEntry riscv_iommu_memory_region_tran=
slate(
>      };
>      uint32_t devid =3D riscv_iommu_space_devid(as);
>
> -    ctx =3D riscv_iommu_ctx(as->iommu, devid, iommu_idx, &ref);
> +    ctx =3D riscv_iommu_ctx(as->iommu, devid, iommu_idx, flag, addr, &re=
f);
>      if (ctx =3D=3D NULL) {
>          /* Translation disabled or invalid. */
>          iotlb.addr_mask =3D 0;
> --
> 2.43.0
>
>

