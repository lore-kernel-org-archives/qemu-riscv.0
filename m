Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0133C47074
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:40:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLa7e-0001Kj-Td; Thu, 04 Jan 2024 21:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLa7d-0001KW-V3; Thu, 04 Jan 2024 21:39:45 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLa7c-0004vp-5w; Thu, 04 Jan 2024 21:39:45 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7ccfbdd77f6so408005241.3; 
 Thu, 04 Jan 2024 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704422382; x=1705027182; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPek1033MHnQivK9TwpKrzb88hwuemrYk/9zbPZXaig=;
 b=XxvUJFqYP2yFwjX/jdKzBOyPu7qT9xSurBY5Zd1zk2A6XL2wq2BXhUEfInlZqbsqjt
 ftNjVHKYlA4RM0JxG9/c7vaaTvUV/vdJPPxtHoCqAPZY6lOze6OaimyPcPRuNVg8nw+6
 w1nEMIToLPiWHQjmFRWQNwzWhhV8nuhb0KGPhoxR5qhVm9BQ7whM4nU0ukrOFhx07N81
 KVGyH2wTu9TeMxBz5Upp9kft7bofPa6P1n1qZ1Q72a1mmGmurIifcLSgA0I+wEWr64cl
 4n25uF/QpA1Qui0VWRNMaHnULWKGekUJJrF8imy1dNcdaihEnTy8nc0fTkzdgsrS3Q4u
 fSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704422382; x=1705027182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPek1033MHnQivK9TwpKrzb88hwuemrYk/9zbPZXaig=;
 b=nOEXUIdcQvVsmh3h1uUl0ivRhFtE8QP7rm87KTRm4m44UwAy0GMoOaLXEkPwFKmsdy
 UrCHifZwStRZXYJvSLVAz6ol3iwIy/fBFkHGuWSiTsfb8D20tFfjPqaFIFoN0GnBCw7J
 oFoqZmSaANRQym13q0vetd1Bu7XUHXlMrbG4nIETQ1OJdC0buZ9ZnkSHpDPoKqN5D7dl
 JIVcIl9HmTDRZ3XVD/YExEYIr6PEe4gagmgXEwp8vew9xNLnvzMO90woSvn57WOgVPQf
 RDcCKbMQq/67HbclOgoADm5Iu7r4uIptZlmJkub0ZGDplf5EuVZJP3+vsmPlNvwO462Y
 tTPw==
X-Gm-Message-State: AOJu0Ywt6igboMKWapBwaj7Y7+fNPqKgE33bU/eAYfiywHriXsuB6OoR
 Lp1Dxcj0gVcWvlgXlyuTk1THsEGTdqezqvzjXaaSR15t
X-Google-Smtp-Source: AGHT+IFAHNiWTZJJfllDuoBy6de/2qvTPAtYEzTo9aMfXpjPWrCJPDJbl9mHqKvzns4LlqbjL06TsmGaZ/JwSkB+dpk=
X-Received: by 2002:a05:6102:304d:b0:467:1968:87f1 with SMTP id
 w13-20020a056102304d00b00467196887f1mr1497631vsa.1.1704422382415; Thu, 04 Jan
 2024 18:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:39:16 +1000
Message-ID: <CAKmqyKNzwcbVzDT=t7asXRcyN9nBVLnEx08kqAQa4bwJjzztMg@mail.gmail.com>
Subject: Re: [PATCH v13 00/26] riscv: RVA22 profiles support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Dec 18, 2023 at 10:55=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This is a merge of the two profile series:
>
> "[PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs, RVA22U64 profile s=
upport"
> "[PATCH for-9.0 v2 0/8] target/riscv: implement RVA22S64 profile"
>
> I'm sending them together since the second series is dependent on the fir=
st.
>
> Quick summary of the major features added:
>
> - A new rv64i CPU type. This is a CPU that has only RVI enabled;
>
> - 'rva22u64' and 'rva22s64' profile flags. They were designed to be used
>   with the 'rv64i' CPU but can be used with other generic CPUs like
>   rv64;
>
> - Two new profile CPUs: 'rva22u64' and 'rva22s64'. A profile CPU is an
>   alias of '-cpu rv64,profile=3Don' and it's the most convenient way of
>   using profiles. E.g to launch an rva22s64 'virt' machine:
>
>   ./qemu-system-riscv64 -M virt -cpu rva22s64  (...)
>
>   To test an application with an rva22u64 profile with linux-user mode:
>
>   ./qemu-riscv64 -cpu rva22u64  (...)
>
>
> The series can also be fetch via:
>
> https://gitlab.com/danielhb/qemu/-/tree/rva22_v13
>
> Patches rebased on top of Alistair riscv-to-apply.next.
>
> All patches acked.
>
> Daniel Henrique Barboza (26):
>   target/riscv: create TYPE_RISCV_VENDOR_CPU
>   target/riscv/tcg: do not use "!generic" CPU checks
>   target/riscv/tcg: update priv_ver on user_set extensions
>   target/riscv: add rv64i CPU
>   target/riscv: add zicbop extension flag
>   target/riscv/tcg: add 'zic64b' support
>   riscv-qmp-cmds.c: expose named features in cpu_model_expansion
>   target/riscv: add rva22u64 profile definition
>   target/riscv/kvm: add 'rva22u64' flag as unavailable
>   target/riscv/tcg: add user flag for profile support
>   target/riscv/tcg: add MISA user options hash
>   target/riscv/tcg: add riscv_cpu_write_misa_bit()
>   target/riscv/tcg: handle profile MISA bits
>   target/riscv/tcg: add hash table insert helpers
>   target/riscv/tcg: honor user choice for G MISA bits
>   target/riscv/tcg: validate profiles during finalize
>   riscv-qmp-cmds.c: add profile flags in cpu-model-expansion
>   target/riscv: add 'rva22u64' CPU
>   target/riscv: implement svade
>   target/riscv: add priv ver restriction to profiles
>   target/riscv/cpu.c: finalize satp_mode earlier
>   target/riscv/cpu.c: add riscv_cpu_is_32bit()
>   target/riscv: add satp_mode profile support
>   target/riscv: add 'parent' in profile description
>   target/riscv: add RVA22S64 profile
>   target/riscv: add rva22s64 cpu

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/virt.c               |   5 +
>  target/riscv/cpu-qom.h        |   5 +
>  target/riscv/cpu.c            | 201 +++++++++++++--
>  target/riscv/cpu.h            |  18 ++
>  target/riscv/cpu_cfg.h        |   4 +
>  target/riscv/kvm/kvm-cpu.c    |   7 +-
>  target/riscv/riscv-qmp-cmds.c |  44 +++-
>  target/riscv/tcg/tcg-cpu.c    | 450 +++++++++++++++++++++++++++++++---
>  8 files changed, 672 insertions(+), 62 deletions(-)
>
> --
> 2.43.0
>
>

