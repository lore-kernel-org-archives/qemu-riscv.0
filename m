Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F5AC28B2F
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 02:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ttzu8-0000Nu-Ph; Sun, 16 Mar 2025 22:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1ttzu6-0000Nb-KT
 for qemu-riscv@nongnu.org; Sun, 16 Mar 2025 22:08:34 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1ttzu5-00011k-3P
 for qemu-riscv@nongnu.org; Sun, 16 Mar 2025 22:08:34 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e62d132a6a7so2795853276.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Mar 2025 19:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1742177311; x=1742782111; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEvWfgrA1xQt7Pck2ReN71OGZAzJWFV9g5EFB1cLTK8=;
 b=BCAd+kwzGJHq4EfotGtu28IGelRGDrgaQsHnLN3SRT6C+OUAXb6VxBMhuyDYZ6Uosd
 mN/lwIA263uL5V2dJ1/6AT8yr6zDzz2WzS0o1LozPejDEVQPglKexdZjG5M+cnSA675N
 WO3HPXrafU6kBRIuAHUuuXOu7dJA4dgPvWy46j+cpq0YWsGE2XGz+UY62AocofxarWEB
 NVD6LCa5iAm84zJyoXL0DSSN6SUNhyx8TaM1ManTm6LuiBnQZR8/I5JFYHEvi3FdZd2a
 wzCJzIydPFN+TvjqRY//HdAjhgQT6/xV5zN6DfKHqlFEO7D+wCUuFfUpA/T5I7FoyCH2
 UhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742177311; x=1742782111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEvWfgrA1xQt7Pck2ReN71OGZAzJWFV9g5EFB1cLTK8=;
 b=BByWuXb7My01cD8PJlAGG4IYWAQJ2DQ7OWHpu6dgtVZicOcYrhsEuF17OQQgZ2gG8v
 qHTj/9ncQD3RyGuBQ/5spq+iVbyCrtUADlC3xz7jEoba1vST4Uv1BuIsOWu8GsS3MW7T
 qUPx1+RqetQ1LvoKOV8GvStZGEAMihZaGrfWSKkX4JIc0SxDGvVhFAvX4vtGMed6EIk2
 MUr6xX4MFQk/3aR0k0fYmWas8zBwvMCxysSz3RQBOEko1bk+mOhsSFLbey4C/j+3Y9gG
 iALfz3kCm+VJ1FQoHJjJVRVlygzBxNYY7DKXgisuFGNt+ePSwv/hnTihZDNpYlAqNAVd
 VZZg==
X-Gm-Message-State: AOJu0YwDSQQchZiSVnc2BRBp7sXBkbL8znx/FAVwFjxma2CG1pHHeZom
 htTz5oB2ErYvDlx+40FDh0+KDFnLp/t/0+jlCtDKEEPgHJ6wbXrnSlVDU6ulPoGvSX/cAzcN6gD
 ipz5j7IsFM4nxLTS8uZYfXULQ42Xs+Jq7wDN52w==
X-Gm-Gg: ASbGncv5NPr0yoal7aw2quOXOLH20CxP0P/6mLyO79Lwgp6c2an49ks/glgZ7Ze2aIY
 E5ZdTfoxAb1BuXwG41/NH5C+1XbLs3EITub9ufSn3MpE3MJMZCZoYtTCNm2bM0NeoR5Bh4pGjOF
 wFcGaY9Hd9RZaKwfdALRhbzkeWhRUTjWMbugPiegcFiX/0WTakfiwOtm8=
X-Google-Smtp-Source: AGHT+IFQraTHV0NnExhL+b0DQnySWKsDCjDtgjmrW0U8OfzB/WB9ZYdqhHb6HtBZL97EFuayyrDvSCsb/CWIHhDHUY4=
X-Received: by 2002:a05:690c:3813:b0:6fe:aa66:5d84 with SMTP id
 00721157ae682-6ff460d0e48mr141434407b3.37.1742177310841; Sun, 16 Mar 2025
 19:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
 <53591e3f-78d2-463e-b857-0b7d170b84e5@sifive.com>
In-Reply-To: <53591e3f-78d2-463e-b857-0b7d170b84e5@sifive.com>
From: Anton Blanchard <antonb@tenstorrent.com>
Date: Mon, 17 Mar 2025 13:08:20 +1100
X-Gm-Features: AQ5f1JqX_p3knzu0ZP0C9Gy5qROtmUfYKwhxccBIQey5w4oacUgQEpVUloR49v0
Message-ID: <CAN7m+mAtsMtafZzWVhUJzVCHyrAyhPN8a3zAdGzFk7=evJWHRg@mail.gmail.com>
Subject: Re: [CAUTION - External Sender] Re: [PATCH 00/12] target/riscv: Fix
 some RISC-V instruction corner cases
To: Max Chou <max.chou@sifive.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=antonb@tenstorrent.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Max,

On Fri, Feb 28, 2025 at 1:47=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
> While reviewing this patchset, I noticed a few missing parts related to
> the mismatched input EEWs encoding constraint.
> I also found a few other rvv encoding issues and planned to submit an
> upstream patchset to address them.
> However, I think it would be better to merge these fixes into this
> patchset to maintain the series=E2=80=99 cohesion and keep up to date.
>
> If you agree with this approach, I can integrate the fixes and submit a
> v2 of the patchset.
> Please let me know your thoughts, and we can discuss the details further.

Sorry for not getting back to you earlier but that would be great.

Thanks,
Anton

