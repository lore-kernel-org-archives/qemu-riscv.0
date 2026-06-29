Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE26EC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:56:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we1EC-00057r-R1; Sun, 28 Jun 2026 21:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1EB-00057a-G6
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:56:03 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1EA-00078i-1D
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:56:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-695f6438518so3901317a12.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 18:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782698160; cv=none;
 d=google.com; s=arc-20260327;
 b=ja9bnzYLGI5PO32YX4XDj/N8GZUmumakPNIMtfX5jVf03ibRnJRK0fPBp0keJRHv6T
 vjx4scyUEhy+SV7mrozZq74dRXHxmD7CbXq+GneA4WwMeioM91hi2KD+d+zWxoRQxNGf
 flkCxZf8n5hfTTmHxwSmKIPMBNPEzskgQ9+Z8Za3fWMTuJ4BRLqTAsYY3uCkpn7+oVUa
 gtmPnFurUVza29FDkWpBIj2Px/+ICvb61mAJm/BWLq9QWePzQpK3P3YQUAUQBgjMqbzU
 jSvhGCssIXMBMUyFs5pYMd1qKb/Fgi8v4HUEfygoOtE0cep3txymILPyH5HEY8CJP1X3
 CA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=67SGkREIpxmBr1FvlfzHlYWlqTReQj5J+e4yvFMe5PQ=;
 fh=FP+DY/7hkYQy1Qt4B9dOurnE25iMsGtK2FEsszp7cuQ=;
 b=CaG9FIFnIg3Zt9QqdvN7EEtS9uPlEiAj7wgAB+l3Up/XoMmi6KPg/+Usgi69wBH783
 PU+dF3l4WwQ1F52WUbGCuDLnab9++O2fflYSQr+PGHwbMOV0ZalRhIqU5vL9yihxxwe1
 FgX3zWZdbTXhaDsp54D28tTEL6rr0tXM57QV5u25sHTqwCKf6kpLifE7puv5bSmkCubL
 A/smLovUzCvmmtV8aciAVgCnCFcH/GxY+2vGV3XsSwfHxlAIwABhHAhT9I42voBrrca7
 sAScweUOEzcxqEjibMYUu3Vn7oHTlbSVQPxEbBloYhk4eKkNdjc7E71aTfQsF2q4ri9G
 2P7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782698160; x=1783302960; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67SGkREIpxmBr1FvlfzHlYWlqTReQj5J+e4yvFMe5PQ=;
 b=nqEXRMuDoLlntxk13RmC62HComN/H1+Vb3UoxX9mkMmp+WGnD3fKOz+4vnUoW1gXtY
 ja22BQnFCHa+yXAxhn0gITX/lbL8zFheuzw3hJ9J297fo47BToZ3MA3PBkBtMm3DYoIv
 gZnHT5YBthas86GGSLn1AsEzbxOnrvzH/Bsff/I4io5b1AcDVFzEX82kE1XZAJxO4NLT
 zuhxy7KNl9FacHqzUGHOnMSlbwW1DgvxmYRyqoynr/h+aiwGaYsdXHdFmQtk33ZZZqJz
 +WH2MHp8McMVXLvJrff45uJjrH3KORZe6C/RbxCUxURSjaC3es/wZjMsMJ8OrWCbadnA
 QjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782698160; x=1783302960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=67SGkREIpxmBr1FvlfzHlYWlqTReQj5J+e4yvFMe5PQ=;
 b=KtG2+kyZJrjR2kfFzOXp+KG77IL7YbQOeNMqNShwGbre696Qsiq/4qCQ7PZajaR2tq
 CSr2Q/QuC+zHcfxTkEgeq6UXV8jmzbIdHFdNaiLuYlV7QMZlpsMF7yATtBH0oZe6ds2p
 x7oQI1mUcvTOmPs0T+bP8DUWI5z6FjnBGpEnUHAbvc0CfhkfHLE6UVtxrpPgE1vYQ61i
 /WaX+thG/5n2Iewjk749Llimu3Igrtb+m45EEvP6vx7ur6dcXlFBgSnzEVVldmUVJDYG
 PsEeGx0MCCcUMNzkpwTVdpAJ/0q3SUzf+mcmzA0HRAZfLAK3zypz6lln8VmLD7sVUOFy
 cBbg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQWGGrN/9kdFGYtSYxGRU1oikeaeY6yoVHYvfEeGF/tPgCg9K8o0leDRg9c+X26QAF9UhHo/jghx4J@nongnu.org
X-Gm-Message-State: AOJu0YyWXn7sG2W64qgbP7crWE8EaJC3kKgeMxlXLN+9isIKmuOfNxsc
 ONmj4vva6O7Vh4Os8IKQDRaLbpcamtFYTH6V5Xlff9JirBIdY2wo/oqP+2+Kx5mHeq+CiYH3sBd
 9EhSov2Z+bhQr7LAkt+/pcneBgigakxs=
X-Gm-Gg: AfdE7clpgd8j/UkVoXymRHypDZ9kUXzFdtYHiIeXbJaWmyfsL109po0u6LL7QH+0rb8
 6uJZpronP6C/qVNO22dLj0fefYnPKULOw6//23p73jR1ry2ar6wVrus82CAf2Yc3KCPZn1FKSyb
 US3w0ph/8xWb7hm2ys5Mv1D70Li2au6ULZhM2BNSZInBHJsxwbM/JXHNLiWybmZE23zwQ69/tlT
 q4xTVcV07ouyvuXMSVvwVfpm6/2oxeiIQ7yYdt5BVCdLxhYTvh1yla30kIBjDZYjs1bUClIAzTO
 fLMkQTI/WFo+1PCEuB9pABu7u4XJgw2bJSwcSw==
X-Received: by 2002:a05:6402:26c4:b0:698:642f:b871 with SMTP id
 4fb4d7f45d1cf-698642fba7amr1092276a12.9.1782698160402; Sun, 28 Jun 2026
 18:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_CA380CBF4A98C990C07BC04A9E748C438309@qq.com>
 <CAKmqyKN09Ut3BAnUpF4Fen=DzMcT=sNpGjTHa8yPeu58H5EpDg@mail.gmail.com>
 <03156de5-9081-4b32-93ea-eaf363acf8ab@oss.qualcomm.com>
In-Reply-To: <03156de5-9081-4b32-93ea-eaf363acf8ab@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 11:55:34 +1000
X-Gm-Features: AVVi8CctY97hL8OePVBkfzMZ9qQha1Sk-UyKxvoNHJivoN7gySykYjAFBmA6fH0
Message-ID: <CAKmqyKOtPw1ca_QsaxYMiWGETTT0mVyA-ENb12b7aKO7F=uACQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: ZhengXiang Qin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
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

On Mon, Jun 22, 2026 at 11:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi Alistair,
>
> On 22/6/26 05:03, Alistair Francis wrote:
> > On Sun, Jun 21, 2026 at 10:48=E2=80=AFPM ZhengXiang Qin
> > <qinzhengxiang@foxmail.com> wrote:
> >>
> >> check_zicbom_access() currently treats any probe_access_flags() result
> >> other than TLB_INVALID_MASK as a successful access. However, a result
> >> with TLB_MMIO means that the target is MMIO-like and should not be
> >> treated as a normal cache block management target.
> >>
> >> Raise a store/AMO access fault for Zicbom accesses to MMIO-like region=
s
> >> so that cbo.clean, cbo.flush and cbo.inval do not silently succeed on
> >> non-cacheable/MMIO-like memory.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
> >> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> >> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
> >
> > Alistair
> >
> >> ---
> >> Changes since v2:
> >> - Add else before the success path for readability.
> >> - Keep fault_addr as target_ulong since CPURISCVState::badaddr is targ=
et_ulong.
>
> This is not true, the fields is uint64_t since this commit:
>
>   commit f2287c7020f36e2f13622d9635a968d6f6fb507d
>   Author: Anton Johansson <anjo@rev.ng>
>   Date:   Wed May 20 14:53:43 2026 +0200
>
>       target/riscv: Fix size of badaddr and bins
>
> Could you update the commit, or ask the contributor to repost,
> or clean on top, please?

Thanks for catching this. I have dropped the patch, please rebase on
master and send a new version

Alistair

