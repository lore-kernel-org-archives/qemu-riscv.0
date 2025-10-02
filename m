Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C8CCA470
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 01:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v485R-0003Ed-Ey; Wed, 01 Oct 2025 21:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v485O-0003E7-TV
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 21:26:22 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v484r-0002KS-6y
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 21:26:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3d5088259eso78715266b.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 18:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759368331; x=1759973131; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0d6xTVVaGa0O7F06UlJ0sV6NonZt+8NWQ/iOUNgRuz0=;
 b=H2syL/bvXiFNxznHBpEMn5HVXBS4fCXBdRiIc56KEIXDvv3XLnQz3Hsz6Zho+Xgus2
 qb6uycE26CHj6LYUJoQLIKe26exmgSgQgWXOHjV4jkf8he+i2LWbpbtoMwVHGcewPzmU
 tQMVjO0KG0m+hciI5t4ROU2SMxxWCtZu9THXHE2F48fNplfFS/yDFWRz7qFRHBkCRN16
 BgCLWdEmyH4Sw4tDhYtc4OR3AeSNlpdRjnu29+ZGTxh+rROWBj6xUMyUoEEGqHcuhrc2
 sN7jZmJK1Y75xfjxcNvkV2b4UOq6egLCZ3gAq3v6GQMVPqrLItQiNpDuhRekfLGU8OIy
 u7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759368331; x=1759973131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0d6xTVVaGa0O7F06UlJ0sV6NonZt+8NWQ/iOUNgRuz0=;
 b=N2wCXJ7kZKfuulsRNlEbAg8ug1XmmRjZrpfHNiDGMqH1b8GDnCUCHy9zDJ6xKZX91i
 lI/rbSt2xA9ndAVKTWG2rBd/6CbcPB4bZtjNtWCS3nnPdZd5IpqjWTDNPS4jk6nHcsTx
 s9Zg16u0cvBzK5PixXyFh2V3unzfBrHJ/11EVKsxJQUIavDyf3/qbDAx4hN3kFI14RA5
 ii38T/mhuqhCauPewAyWc8Ng2D3CQwNtrOHnyTFpN/1kF33YNIo8yNADc7wg9wukxDYl
 f4rf48Y3Rm08A5s/6fsiKDwKHKDihZERvh+EV8g44B9rRBlJLmlSJyrfvsevSSgsGEIX
 ai/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVfN0/B+SrIMyntdULn1ik2v9+d4EJTOkLVka01q4+o/o5SKmvkz48Hc67nW/lyG6T00y+CFbMe7II@nongnu.org
X-Gm-Message-State: AOJu0Ywl8R8prS2uWXo9Tq/O/EwMLEemECn5aXtoap8asfd6qncaQkR7
 zsmjFMO8VPiwoJy0hWPEumb+lVpMFPpOfRbIJGn9y89hrEvzvB2dUa61miC5O/7TQ6D46eW9bTF
 joYdWqtjfUS74nTj5MpTDDA/cpbl/NDw=
X-Gm-Gg: ASbGncu85fzj/EKVVnt29Fi9XdrL+z+JzntfMDx9MxxirZqsqISkDHfOclgZ8rR/KGa
 ERE4cWAj2tuNZOeAU1SB8z8dfraCA16kd/dGhTQYb55bsclt8T/EevXWjxi8dAIvC7EDtKw0c8r
 3pnvUyWsOo9hSK4n6SkbLIbkSFNix+dqfQoz0dkBEfjSESiVZMoSNcdFHOo7pjc2DsqJqhD9aFd
 e502aokvf5BBgpVE0DqhO1SMqEZn6QujzdVVnCY1opNExA7ZWWgJMDH5yc2Kzj8FEklHevJ
X-Google-Smtp-Source: AGHT+IEENBqKXl7/QJqg+J4VPgf5B2VccI8HWKF395sdDp+ixKGuC/xLUDsM9f1UseQj9xOGAgJBvmF4aS8rq3r+eTU=
X-Received: by 2002:a17:906:8f07:b0:b40:8954:a8bf with SMTP id
 a640c23a62f3a-b46e0ea1cccmr509471366b.2.1759368330595; Wed, 01 Oct 2025
 18:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001094859.2030290-1-djordje.todorovic@htecgroup.com>
 <20251001094859.2030290-3-djordje.todorovic@htecgroup.com>
In-Reply-To: <20251001094859.2030290-3-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Oct 2025 11:25:04 +1000
X-Gm-Features: AS18NWCWdi9llyalL4EjQGXU9hZZQOIk1N6p8JUpwb_BnpwXvDYDau9Z2iLW8YI
Message-ID: <CAKmqyKNvLrdgXFe9Tu-f6V70Cv5piNwNVT8nQZGLt35vAfOGbw@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] target/riscv: Add cpu_set_exception_base
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Oct 1, 2025 at 7:49=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add a new function, so we can change reset vector from platforms
> during runtime.
>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 14 ++++++++++++++
>  target/riscv/cpu.h |  4 ++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..74728c5371 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,20 @@ bool riscv_cpu_option_set(const char *optname)
>      return g_hash_table_contains(general_user_opts, optname);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address)

This should probably have some documentation saying that it's only for
runtime usage

Alistair

> +{
> +    CPUState *cpu_state =3D qemu_get_cpu(vp_index);
> +    if (cpu_state =3D=3D NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "cpu_set_exception_base: invalid vp_index: %u",
> +                      vp_index);
> +    }
> +    RISCVCPU *vp =3D RISCV_CPU(cpu_state);
> +    vp->env.resetvec =3D address;
> +}
> +#endif
> +
>  static void riscv_cpu_cfg_merge(RISCVCPUConfig *dest, const RISCVCPUConf=
ig *src)
>  {
>  #define BOOL_FIELD(x) dest->x |=3D src->x;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..34751bd414 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -672,6 +672,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState =
*env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address);
> +#endif
> +
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>  FIELD(TB_FLAGS, FS, 3, 2)
>  /* Vector flags */
> --
> 2.34.1

