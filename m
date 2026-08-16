Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE920C5DF6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 13:24:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvaqf-0003XM-Bz; Sun, 16 Aug 2026 09:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wvaqd-0003WV-DD
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 09:24:23 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wvaqc-0007bO-1n
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 09:24:23 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-836c8bde2dcso32482097b3.0
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 06:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786886660; cv=none;
 d=google.com; s=arc-20260327;
 b=cguWfK03h+jM5phKqaIlbpJviJcCZQnRGaeGYCFFFjyTSp3jcy980Gkze7pvCCyQEK
 pFgVGTJf9iTOCbSyQa78/bdAppoFz0YNDuTr7nD2sIIyt0PGPn1tC8aWRqs4nJ/6ByEc
 SYiK1Hn0OqENnndiYtauMvFyCmrymSu7n/PsdTZgyS8O4dBbO51D7ZVyyUcC8fM8uioe
 N2RMBo/3FHXWrHSj8V8TcQU8W95LcS4tkOODtZx+LZV790Ag+WNZXyy3bbn7egq0iMCN
 czoUly6zZ9JAaR5rUyVAWmiMXq5Kqawm9an4/aOMxm/hYtlQ7KIxODo5lUrbha31vWd0
 7h4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ox3VbeM1u2jQWUSElzMGWlBfzXD9lmGGaDI680VJIjc=;
 fh=I/K86cAMpDwm5fYUJzWMAsvNYhhayLE9zXguEyGtPvc=;
 b=HfRApXGct6OOfb4PLenjtxInVOrHAWbz+blTUOaAxIocmZm47x88T52HMdmeool4Q1
 jl1GQdfdqDy9aFIqm3KqXCWVHPalzbkIhflFNoq0UJJkvJ0IVRVT4kJ0CPMTp9vAZsFZ
 WT9XTLPZF75MR9x1OjyRC9IF8QVWX2mjOV6uDr/SdVYRX1K0t+ml7SIK10SF+/uQY7Q7
 ePCs6wzGxhrC2zzKJLWwFdzjY+UXx4w6tV9KrqVE0sdv1CBFhVgIuXIDREg5scOzbSlW
 TRFoLOymST75Br4i/0pXdIhHLarUGvqqNYZyxzHDQ6Odhz4aDuSOpmmewRDscgpheVFM
 ZWdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786886660; x=1787491460; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ox3VbeM1u2jQWUSElzMGWlBfzXD9lmGGaDI680VJIjc=;
 b=RAYncfja3BL52updb0VawJZQWl2Y98oagvs1KDUnsQMC1JvIfyZhnwsxMLcF9AgAZX
 alt3SvshVDDbkn5hCIXAURtom8j5HdMGLXOG+/BeQdT9LNOnwZF+FexzYAzPN50IzfHf
 AZQv0FmA+mBhBk+R/hNNmcLlgtzBaaYIn4Hsg0FW1OuBLKtSCvWWwDEYTniSDI9zEfCc
 ToFeB6RpBeW6p4aMjhn82fFvdQzrDTm3gFaSS05IPQi7kSlNUpwZNRK8FJh/+y/hoBy2
 TVybxElXriB+r8nrkidYbCKDtHNjj5MsSm2XGPov+GjKS4uoFjIcDF8PvAmgaLgJig/q
 fVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786886660; x=1787491460;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ox3VbeM1u2jQWUSElzMGWlBfzXD9lmGGaDI680VJIjc=;
 b=ekc9TkTYFzX4URkzfSTP9bXleJH9EX4EanZTDx6iiIw5dZU1dvCIs0dJ+tm3CMlEqk
 Sld8TVPvsG2viv43ippgBRPJwK4rZx4xB6+AqnHCofhciMs6JhtbqIvNRx3wOVarpAa9
 iV1hud81UGLRyOturPHdO2TOZIj2lxVFj9UZoFrzercB6vumiWVn2ZlN2cSYUcpx8zll
 zD/5ItZJEs+PZK3NdvkeCOZQ0pg6PLFdNYZYqL+1ZINh5QGEBX/fG7R+DoyKetFngyPZ
 gAcwE2k63UEXYp1E7/9YDPrVVRpbZQz4qw5jvoRK7TuzbFH1Lo1GOksMhXllRVmHshVU
 /kBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXCy8s1XbpaGdXeNFX8/crNBUVotBr5dJ6jRKlq5xeggAptYx8PXOGG5tnlvVGz0xWZ8B6ZPR4afdu@nongnu.org
X-Gm-Message-State: AOJu0Yz6+8G2DrJXOf08p/bQ2en0FAPUCIdP0Vnj9veSdCwsCstP/6f+
 MAXGlRleVBpZCX2sy03JT08wmzeJL91mRXxFjsyb+eQqfG5Py9d6UKB/4MpbnHFpzUB3v2/VLan
 /5ACRVb/yvAT0UigoCcVhLmgz7DIv9kk=
X-Gm-Gg: AR+sD12v7wqYXoivNeUVqZ8A2iM4WDrpZ4MBuU0eiKb6rMkspOOJt8eLO/t16kjAWEN
 Dgahx8X5GafMfgl8ONEr9TuLjv+e1VH95LM7nuNxpqVseUcgE0nHhTupFQGIt7OhD1OaujrJEUU
 q72Vl79rrSF4IVhfrdL450s5kaMQz2w1KIVFLfOfNtiQ/54dz/ELZfpBkVAD4EpdQ5jZJLhRLp8
 xtOcx4KL6YzsmnKBKOq2d2NdKk3DAsP84FiithMq0LEPnlEq5EbicqhyP303PAjRmVCKGjLwLeY
 36lQs+hNkHJUk4o6YRBmUC1DYGY1q3MpdqarlmsH0YqArs66ZN1A
X-Received: by 2002:a05:690c:5884:b0:81f:650c:98cd with SMTP id
 00721157ae682-837120f2d58mr46179157b3.28.1786886660422; Sun, 16 Aug 2026
 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <20260808182956.290561-5-flamboyant.h.01@gmail.com>
In-Reply-To: <20260808182956.290561-5-flamboyant.h.01@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 16 Aug 2026 21:24:09 +0800
X-Gm-Features: AcwNN1VJBr11-OJJFw6NRDtSX3pBflzN42xlDlFlE_7igUV43bSMp2TcFGlBZSI
Message-ID: <CAEUhbmX96k20FrD38Az9B4_8w=s8G1vss0qk65aNRFqHFwc0Lw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/riscv/k230: Route SSI interrupts to the PLIC
To: Kangjie Huang <flamboyant.h.01@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Kangjie,

On Sun, Aug 9, 2026 at 2:31=E2=80=AFAM Kangjie Huang <flamboyant.h.01@gmail=
.com> wrote:
>
> Connect the nine interrupt outputs of each K230 DWC SSI controller to the
> documented PLIC source range.
>
> The TXU, DONE, and AXIE lines are wired to preserve the physical K230
> interrupt topology, but remain inactive until their transfer engines are
> modelled. Extend qtests to cover TXE routing for all instances, RXU routi=
ng,
> and instance isolation.
>
> Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
> ---
>  hw/riscv/k230.c                 | 36 ++++++++++++++++++++
>  include/hw/riscv/k230.h         |  3 ++
>  tests/qtest/k230-dwc-ssi-test.c | 59 ++++++++++++++++++++++++++++-----
>  3 files changed, 90 insertions(+), 8 deletions(-)
>

Please squash this patch into patch 3. Normally the instantiation of
peripherals is done in one single commit.

Regards,
Bin

