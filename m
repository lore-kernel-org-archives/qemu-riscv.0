Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC3CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:25:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uxzq1-0008K8-VI; Sun, 14 Sep 2025 23:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxzpy-0008In-Qp
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:25:06 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxzpi-0006i0-Vu
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:25:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b07dac96d1eso298112266b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757906684; x=1758511484; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgCskFXuUsUjbjjHf89rRVbnS1RbwW/emE2kv+a/jR8=;
 b=HqFbfti6JlVf97MOlCCD1KmsMWHrfnihHobjIrs5AALEoboo/iV8rSk3GGl4LWrnl+
 7WCycvm/lmEttvRlWM3eZ6oIrF0r7NtuobdKdmS5Z9EPKLIZqz8JNjGO6JU7nBzVExaH
 FvU+q47If0hOPR1njWjRrb63wPf3XV/r/ZciUaChlmePMLBiprtFoKucWk78pBBthPEm
 M8zMWP7KKNs2QahAU0EG9muo0nDEPF+CZRpwXXvFQEsJzfC3KsGJG/8U5YmY3cvDxl4z
 4CFFTXEFFdG4lk2k0LkBQIEiTIRIyBhWRSn8pCXNpzsR+2v8dFqr7P2YP6un6cwaKEEP
 nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757906684; x=1758511484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgCskFXuUsUjbjjHf89rRVbnS1RbwW/emE2kv+a/jR8=;
 b=Ee8KasMhTy3x0kyYKyGLiMm8vHcJxWkHeEMtWN2VzswP4c1wqg15czrhJRvaC3RB80
 UfOoGHmHdRgJVVmhDYoEJsVQ9foxcvNQFRP3XtQmPdazdCDBi3DvWDhlUK5Tgf4MZc3T
 OVaWmjihraBQBXwM8AadEB/Nyo9VRAO1WAL7yD3/W9dCB9YnG5UomnJLQQrR8cg2KYau
 6zlAIAmnUNtPU17nE9g0tVuXuPWadZ5GRA+ufsrGoDgKvEjHrxZ7dowWrFOKVB20yR15
 t9UsuhRtO4ZB9PwCB1c3GcPWiVPLM48/OsF6V8mnjinrxZakMKDg1votOXcu9kcE80mS
 QsMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjzIZTuvK3bJgM/zi7P34sZhINWnhVLmPLvaRLYyX4pPcwDa9C3F9FuWwx6G/Afd5gYMjX2qjAJHls@nongnu.org
X-Gm-Message-State: AOJu0Yx5LYpH7teojNfK4ku/7O9N+rvO0QGIaPFC9gXp60zL64nf7Bf1
 U+HDZ4c93YR1GwZEO2ywIyniO/Lrv8kx7ukpEfPrAMGTdcQ9MfxMrmFuioeD9NiGWhuyPoLRVNe
 0ZYkhlE9Cn0CLDSToB8K5xaGAQpql2hk=
X-Gm-Gg: ASbGncsVgddnNoqMV5L7HYteX8qiqCM0FFTGDdbD3T2R5iJxWlHYIlOU7BgKWB3pLvC
 0eFcyhu6JFfcQAtrCvCCScm2kL39wZuvQVZzkbeBMjeCfyEmPh+vaRnr/wUKxBILx1xCkZ9FglT
 g8zIF98cX2DXC9BXgi30rTGmD8yVhK189WgZOvr42/tj54jCAuttO+tcQzTOoDbCn+LHHILvGZh
 tZvC/uAof5H5ps8ZkIrG1UB94jf5WhYx6q6xARjyMvGWml8
X-Google-Smtp-Source: AGHT+IEKvrnaEqgza7PqoB5amQsHRkhpOZATzkHFU+n1AlNc4hNqcEbkt0XdzXcthuW08mLV6ralF11zJRk0pTZ0zp8=
X-Received: by 2002:a17:907:74e:b0:b04:6546:3475 with SMTP id
 a640c23a62f3a-b07c22b2136mr1298716166b.6.1757906684192; Sun, 14 Sep 2025
 20:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250723094213.2975268-1-dbarboza@ventanamicro.com>
 <20250723094213.2975268-2-dbarboza@ventanamicro.com>
In-Reply-To: <20250723094213.2975268-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:24:17 +1000
X-Gm-Features: Ac12FXw0UJN9dMKdDlNnDyFddzgomQDaqWghFDGwHaLuP6-gT94mpVUbq35sr5U
Message-ID: <CAKmqyKP_iM0GAM4cZFQsTcvMvi3DjCS6h7_60EPSBnh-UQsb7A@mail.gmail.com>
Subject: Re: [PATCH for-10.1 1/1] roms/opensbi: Update to v1.7
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 23, 2025 at 7:43=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Update OpenSBI and the pre-built opensbi32 and opensbi64 images to
> version 1.7.
>
> It has been almost an year since we last updated OpenSBI (at the time,
> up to v1.5.1) and we're missing a lot of good stuff from both v1.6 and
> v1.7, including SBI 3.0 and RPMI 1.0.
>
> The changelog is too large and tedious to post in the commit msg so I
> encourage referring to [1] and [2] to see the new features we're adding
> into the QEMU roms.
>
> [1] https://github.com/riscv-software-src/opensbi/releases/tag/v1.6
> [2] https://github.com/riscv-software-src/opensbi/releases/tag/v1.7
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 268312 -> 268752 byt=
es
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 272504 -> 273048 byt=
es
>  roms/opensbi                                  |   2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv32-generic-fw_dynamic.bin
> index b2e740010b..02be3a72a8 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv32-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv64-generic-fw_dynamic.bin
> index 018b4731a7..cce35c65c2 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv64-generic-fw_dynamic.bin differ
> diff --git a/roms/opensbi b/roms/opensbi
> index 43cace6c36..a32a910691 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 43cace6c3671e5172d0df0a8963e552bb04b7b20
> +Subproject commit a32a91069119e7a5aa31e6bc51d5e00860be3d80
> --
> 2.50.1
>
>

