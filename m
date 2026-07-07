Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F2C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 04:17:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgxEb-0003Zh-Qb; Tue, 07 Jul 2026 00:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgxEX-0003ZJ-Kl
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 00:16:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgxEV-0002e0-KQ
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 00:16:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-698ae09e356so5273836a12.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2026 21:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783397790; cv=none;
 d=google.com; s=arc-20260327;
 b=p51vCQZZz36xIDiKDfT+9djo6Jj6f6f3RtMHX+kpWVKjiW9WhTK3gsXaLttB655Hiu
 v3YhHvnao9aM6/jvElylu2ppXyJiGuG7PS+8saruROrgimAEC0KkCckqgG137GMzIu0F
 77ey52uW5GudBE6BcBWOo2dqLGlAei8JGGZjSD7ceVzB7j0ScPY+ERgosbJwawlNQ0I+
 LPEyx9vt3AzE4PwUZ3rmuhIp7NFHsb1kJWj8tOm06Vu2lpmbyqVpiDXnpXjwzjzbsM9P
 OOF6lnC9B0RNIu2Vc5u1+ADhHm+7aIRQVL6F/9PZcxiRkaktBLRcfikFaIdY6xPH4vyZ
 2wbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=C2rZhRVSzSTBCQbeQkRl6gll6ieXUkcXm0/wsN2/YpA=;
 fh=p/RBWMRWbuVLgISfHvf/gxvmsI8rAEuyqtrvMSU2nI8=;
 b=R9QEbqSoJ3jGoY9K8QTJsaCQPCbPLGxMoRw1ZSMtbXU6fUfMsTfsRY2axeH8CKOgn5
 ntJps8wk/zl0Qai9rfUhviEyf8GDdyeV7hYcreAFrGdhkpxp21Om2eUHE5cESDz0vnHO
 Z8VidPvXEHobag+c6Z/q2A5CKxH4NbgJO1kDsPI6UTSgwMGY3O6QZE+LDRE/qQvJyeb4
 Sd5mA7sISCeNFGs7BsQitp8RmyVKe6Uvb3O4qNRuvFHlL9AvooGuLPMIu70T7UoAh3GA
 7rulWzRQcDO/QOBPsTmjImqixx6WJwcu2nZhO0SqlujktGt7On1hyMkAOCdhy3ulFT0F
 375g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397790; x=1784002590; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2rZhRVSzSTBCQbeQkRl6gll6ieXUkcXm0/wsN2/YpA=;
 b=prPz5Ti/vzp27d26kEtgDd6nW13b7eqsRoYp0t27q9fhl4HMzfuUeCrJpXoCzcFLZE
 +Gh6XWWPy8Nf47chQWbXhlk7fPOgPDitmwkDptAjpMnhPzq+bU5okDcRNbMimUrBOwJJ
 ABDAJb0E6R7Lf5xqzwpmbQvoBxPqCRjM+cDpApNghM6YblimGFydQ+zJB1hDmTKwliyk
 1dgjz8FUULQ+RhVlWcYpYmE/j3OYLH384FqonawOM8IrVvqf8bZyQfh3LZvsJcC06of3
 hPX49iMMt7Wjfdf2v6dIB2j2EI3Jp3eZoS9TPJvrTIP01KwFlQHjCBhaA/fxU/nwrDPc
 Hr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397790; x=1784002590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C2rZhRVSzSTBCQbeQkRl6gll6ieXUkcXm0/wsN2/YpA=;
 b=EBHLHXqbmMPC+sBCJBNsEKVS93/0VpPI7B97GZzV8jB4NgWQ1qUwDlP4hbgrmo5exi
 wVPcvPMZKGkWrRrVTWXWVjUe1wWFffDDZxBz7z2rufi+k0F/NRQxNsYvedjnvhJSnSYC
 AplktVrkv556EKyykOdLY9LHVt7ZITfk7rBZh7asBXCsf4rls066z0CBs2VwnY+Eymb+
 wD1a2gRAOo/XpibGW9cOacaQPNl1r335NVUGluRz/zcsY7oGdDOiaAXSOmWC8CD+Grp6
 z12w6MrxMXjqf//G9TbFb+4fEDdLdavp1yq6NZmHPJ6gmDe+guh16fQR327pVNYkPQf8
 K9hw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrw+BC+8F7TFnwJB5QEOdhuYGJWt77KVUKmGXJo5aBJHWi6wHEqh+lWVS3LcDrvkuhtYiAtVbtOgKuQ@nongnu.org
X-Gm-Message-State: AOJu0YyOoz1J1prmHfMMFeUskP2UtWdMYMNGW+VAeXanOIKh5CYlO60H
 vnGnwvot6TWX6mHXF3tbruXRoJSugmgMFzCY4C8QmY4t3DtBqE5k031qwQU0QdpE4TiuymQfmb5
 +wsPCcdzr86sZja/87pkkTI72+PoqLLo=
X-Gm-Gg: AfdE7ckRGQiCvcJhU2UC9MIMmFMiReUrBIiW4zJYVXPzVvA2gJlQf8hlWF3vIo5JFEs
 f2eBEstXieIb/frZ7LUZnzit8QDsBt1e+8D4kxynFha5uwbUKSz6/ZjcC/QjRS23wtNtsJrf9wy
 8udhQn4V+B7FDF6K5SzE0b+GcnwJq9CFFKlz5+Hr9+KnLXu9CP3VrqClCFI+e4E5bF/9V3uDVG8
 DEwGO/gXhmjs0N/EutPPmwqX3NjVAKOLAZOKQuSuytkFsMbs6O+6HFczXwI3UIeGAxzmxEH/mue
 fYh+LG9QhBD5uwQVyRf/+0PkLX8=
X-Received: by 2002:a05:6402:2791:b0:698:3946:b78e with SMTP id
 4fb4d7f45d1cf-69a856a459fmr1760668a12.5.1783397789595; Mon, 06 Jul 2026
 21:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2026 14:16:03 +1000
X-Gm-Features: AVVi8CcdFHdstNx5HfHh9-vNjNftHpgSSPGqyAq6cvq2VNLC-B4JpM3H5Hn3dBc
Message-ID: <CAKmqyKMtY28sCXisNXPnnwLyL45gSR4prVQVG4q8L06ksB_JjA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set ftype and iova in
 riscv_iommu_ctx()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

