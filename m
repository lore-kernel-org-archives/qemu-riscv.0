Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECFACD8CA8
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 03:28:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wYxz4-0005BE-DX; Sun, 14 Jun 2026 23:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYxz0-0005AI-V2
 for qemu-riscv@nongnu.org; Sun, 14 Jun 2026 23:27:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wYxyz-000342-FY
 for qemu-riscv@nongnu.org; Sun, 14 Jun 2026 23:27:30 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-68b90fc6a1dso5493682a12.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Jun 2026 20:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781494048; cv=none;
 d=google.com; s=arc-20240605;
 b=CpEmhec3BBLR+Jyw54SrYBi8LhqtvepIKnVZgJpnAZEV+CQcQcEq3Zwu9ApOE29qA9
 pPDbqniiUU2tcMcz7qEmaqDyzks9koV8+jVtqt5PWJg8QQjUf20+5xo2CakLEYMdjXwS
 dsghRT3M5cGkviRweFGc92gQGbjAta2B/sGQ3dzPuu/yPf5d0FxRXuAeAdhZkBA7ZOhA
 uDo68WftyABU2CADJLCgNbNSG3e8aDxwKbcvqFoiClRKkgXnWAcT6/uYlWqDd0c0DLAL
 FaSE335mSRofub8DNkXWjC7fD5xi5msfPc4F9cl6FVpaPm7CpFTpa4iSM3tfCgWZn5nd
 7MGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UQ4FfTTcDabsVKk9SuOEv72D0xBYZO3EwGMTouR0n90=;
 fh=ghhKssHX4mxJdqWORHfRwBJMaPBWQC3BBPLbZ1O7UGc=;
 b=Bn0S94YdZ8fUHudriJsuLPZKml7g/Xs94OM9xV494hPE2rRNr7YUCsJk9mNSSLreMr
 Ceph6sXigVZSWicQXUyVWIzz+FYQfCLUA/9fDSuyyXIh4A526iBH12/yKmZeAeESII9j
 mNuJtp8UJHqm5GQLtE8vV1Wzd3gapKxAh/Eb1kFu9zBZW/Cuw5l3zDCXL06pQcn28MnX
 gHxW6dn3FSaXyZeUJFA4hlqgviL37qnz8ZgzYci9LPeYjNdiWUdxZ87/0i3r58KLWOgv
 TFyB1fH8G6jkprlhw25uYtIjIWleeWCaPlGiCZtjcv7nuh2s807MDCn4cEK4tH+UPDmZ
 ODEg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781494048; x=1782098848; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQ4FfTTcDabsVKk9SuOEv72D0xBYZO3EwGMTouR0n90=;
 b=iEXIbCRj3+Yb9zQomUH/GEp4/yMlDbgsZPZCUT482iDNGuUdWrxXrE9hsbqxrjtjV8
 7GR47JRiigOjDy1TD8EyJhO5hzaDVnCW3YNK0IR1QJ3Kj6y9bPrjz0RX8nbEwMUmvVT0
 v7bH8BWzlRAm08/f2OoWpLphk9gLigGuOUJL5QvSvR5kC23q7Be+BsBjsdsOVNaiVE9A
 9It1CifKrX8pgZEvED/a2nHAnHn9nUjZiKp/Muvx0mCppfXNqJcZ1KwpyCVkxJqmOpVh
 VYl6BVcoKPKD355/Kt2JU0y6MO9by1k98/fLHsEvV8kLt4kIjK+/0dTs2IC5o7hTAJyS
 5puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781494048; x=1782098848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UQ4FfTTcDabsVKk9SuOEv72D0xBYZO3EwGMTouR0n90=;
 b=aixV7UZ4dk897O5pYyEb6EMgo8EF4wWZ0NX6q2NSO5+xG9V1aKssVst+ukhT8OLTbV
 M66iy0nhInv7fT3fHFx6CWNkMC07HvOVejJOQS1l1K6NBgy7+rbf667vp2KS6k9OpgBR
 HOGUhxCNZYyxXgZwpiPvJCU87BfASXFqoagaJz9yJazC3jVoAikIXkoL6VvX8b6lWdvO
 JQZIeaajFnQmobjXsnCVvx7kOoQ0qXKAchuV1Pn95k6Zyl5zl3argDZRorUjzj+SP6bL
 Wxlw7iBqgGlv3kDJWNb05Mc4fvHHiJWfBq/qD3u83/e+1/jf5EkruKNrT6b1SIAuf1Hl
 Xqgw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8iIuer+oJRXxWL+1UfBiiiqI28e26JpIU/DNsb5JxlNFVCbn3U55lRBPi1gtdNIcz/lmFZrrdKsyXu@nongnu.org
X-Gm-Message-State: AOJu0YxYdlqvBEvmg5YrFno60N/N/wdrH9l+A50wpaosZYFtslDoDL3d
 sPXXQDzVQ9SnkT8rq9hgMO20QlJ8zlA4GXSJBTNuT0t22eDJdh0y+bOxz+y/33KBULfXQensYZ4
 OFjH/YfoQ0Co3JlGe471/2i1343j6Uymwden8
X-Gm-Gg: Acq92OHL73yGEDLESrGBVLBLHpcegs9S5EwCV+9/WYWIQoT1eACeoabIWtE0Rsuda9P
 GLijUJafzsQCUqwQHeQOybjn17kvqtH4XgSu3uQaZGv6a3dK8B3pveoNDc6NGvzpmyiCTMI8tCX
 WnIGQH8u9VqktT24C1QRG828q8OUb3yDNxQDHo10xj2rlSWq7ZuKQ2s66OvJHeAZM9WjEnpl9vb
 Qc9Zmt8Vr+6W/VRY8AZ1oSNAEkJHGl70Ue9Bt1Ih57Q17vhtJQPawtHSxs9sgSulJ0X04zQBas9
 J2y5W/KmSTkuEf0r9BbQSpnRWTmxStpynWLVtQ==
X-Received: by 2002:a05:6402:3892:b0:687:eb2b:cb19 with SMTP id
 4fb4d7f45d1cf-69378d96aefmr4904614a12.2.1781494047672; Sun, 14 Jun 2026
 20:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
 <20260611162223.2361941-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611162223.2361941-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 13:27:01 +1000
X-Gm-Features: AVVi8CfHzkMcXAXPqGhH8avjaSxocHHqRdoxgEzwjqfBSyZV9FMYvnSMQMNvVSQ
Message-ID: <CAKmqyKNYsAHGF-RC3Oy+KUtrtG-mEgbkq6eo44ndtyun0W396w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu.c: add 'svbare' satp-mode
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 12, 2026 at 2:23=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Seems like we forgot to add a flag to set satp-mode=3Dbare.  What we're
> doing instead is to set the CPU default satp-mode to 'off' to set it to
> bare ... assuming we know the default satp-mode.  Otherwise one needs to
> do -cpu X,sv39=3Doff,sv48=3Doff,sv57=3Doff,sv64=3Doff to get a bare-mode =
CPU.
>
> Add a flag to make this process easier.  The name choice is based on the
> fact that I didn't find many references to 'mbare' in RISC-V docs, but
> 'svbare' is a flag name that toolchain uses to set satp-mode=3Dbare.
> Might as well use the same name to help with cross project compat.
>
> After this patch:
>
> $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3Dfdt.dtb -cpu rv64
> $ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
>                         mmu-type =3D "riscv,sv57";
> $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3Dfdt.dtb -cpu rv64,svbare=
=3Don
> $ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
>                         mmu-type =3D "riscv,none";
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1b10cc7ef..d968daa404 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -421,7 +421,7 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc)
>  #ifndef CONFIG_USER_ONLY
>  static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  {
> -    if (!strncmp(satp_mode_str, "mbare", 5)) {
> +    if (!strncmp(satp_mode_str, "svbare", 6)) {
>          return VM_1_10_MBARE;
>      }
>
> @@ -1053,6 +1053,9 @@ void riscv_add_satp_mode_properties(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> +    object_property_add(obj, "svbare", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->satp_modes);
> +
>      if (cpu->env.misa_mxl =3D=3D MXL_RV32) {
>          object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
>                              cpu_riscv_set_satp, NULL, &cpu->satp_modes);
> --
> 2.43.0
>
>

