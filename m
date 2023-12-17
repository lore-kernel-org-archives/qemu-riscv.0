Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C9CC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 23:10:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF0GL-0004Ug-WB; Sun, 17 Dec 2023 18:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF0GJ-0004Tx-Ug; Sun, 17 Dec 2023 18:09:32 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF0GI-0003fi-Aw; Sun, 17 Dec 2023 18:09:31 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7cafdcaf187so659264241.2; 
 Sun, 17 Dec 2023 15:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702854569; x=1703459369; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pes4guvSLvMkNWTPWDJcTMLlnjDOjEl8vqGsUVlHga8=;
 b=R7dHFsB6zLiwDEfFxp7GR7bwH5AahFO8XVlYv15NtyWEOuwzhfyhenzpoRYSsHs6PN
 2I7JfQ+rNCE6aJD0ushsXynDhBEmGkBE2OwRb54SGD/jhQeJQc9stsLRIlZRNN0VwC/i
 KmtddusEMZec94YZ8Iga0IEyfT6scbk6TzXekV8dNZVX7sYE9j3VHosPg618FMBTLbLL
 WrxxMujxblR6R0GfINFpzWyAO7VeGj/uv2dlN8zFcp+i4fMhpkl0D2aByms1REswqV3e
 2N9VhcRulbxGhiRMLom+GJLsz8LtSfPVXidzwkb9qT5FePAstD6EAInt9xmSNO8Hd+MQ
 upPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702854569; x=1703459369;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pes4guvSLvMkNWTPWDJcTMLlnjDOjEl8vqGsUVlHga8=;
 b=dQo3kCblgg1M+XI1sSRb31YAlAqhVbSa4Xxsef4M8ihot/XrfZKE0dCzGb5O9Lf+f8
 ZzgiGrQes3EQzHHuL3rrv+K+6xOg3+fzRR0hCedIRiPTzCINZOdGdCCAnFUFfLPCYB7h
 Lfa/DmE5/Y10xFUvSbmQcX3Whpf28YoAyNt26XUlCk4dIvclFGF9q7hO2basw8CAb3IQ
 5EMXZWKLdh7veWKPb8mOsbpVsj6wHRXME4jNeUP8C9uMeHCpew7i+lxOZjtF4UK99PpN
 /eQ7zZNvbCzhswUAeKKaHgDwy5ly5fNi4jOAYDeIWxC5QMlaO7BKTAAECLFrqNrIuiT8
 bz+w==
X-Gm-Message-State: AOJu0YzTGomg+yramPFvPsMC6fNNHXT8GOV5Uxk+yAuGF/yQZQmJQz7L
 uk/N7kfcb/asenmGo6hnz9Q3w/Ypps9O6EsgcXU=
X-Google-Smtp-Source: AGHT+IELVehbAOpH7jqSi31bELbQF7v39NwKD/c92WtcRaeo7anh6H+gpXsu7zDSggSOyYkf5SKveqwS2epWt8qVkHQ=
X-Received: by 2002:a05:6102:3ed6:b0:464:784f:8e3d with SMTP id
 n22-20020a0561023ed600b00464784f8e3dmr11453513vsv.31.1702854568496; Sun, 17
 Dec 2023 15:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20231211170732.2541368-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231211170732.2541368-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 09:09:02 +1000
Message-ID: <CAKmqyKP=9P5KrcwmxR-G9MVj=VYvcOwRbRi5dmKZFe+0EHSLJw@mail.gmail.com>
Subject: Re: [PATCH for-9.0] target/riscv/cpu.c: fix machine IDs getters
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Tue, Dec 12, 2023 at 3:08=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> mvendorid is an uint32 property, mimpid/marchid are uint64 properties.
> But their getters are returning bools. The reason this went under the
> radar for this long is because we have no code using the getters.
>
> The problem can be seem via the 'qom-get' API though. Launching QEMU
> with the 'veyron-v1' CPU, a model with:
>
> VEYRON_V1_MVENDORID: 0x61f (1567)
> VEYRON_V1_MIMPID: 0x111 (273)
> VEYRON_V1_MARCHID: 0x8000000000010000 (9223372036854841344)
>
> This is what the API returns when retrieving these properties:
>
> (qemu) qom-get /machine/soc0/harts[0] mvendorid
> true
> (qemu) qom-get /machine/soc0/harts[0] mimpid
> true
> (qemu) qom-get /machine/soc0/harts[0] marchid
> true
>
> After this patch:
>
> (qemu) qom-get /machine/soc0/harts[0] mvendorid
> 1567
> (qemu) qom-get /machine/soc0/harts[0] mimpid
> 273
> (qemu) qom-get /machine/soc0/harts[0] marchid
> 9223372036854841344
>
> Fixes: 1e34150045 ("target/riscv/cpu.c: restrict 'mvendorid' value")
> Fixes: a1863ad368 ("target/riscv/cpu.c: restrict 'mimpid' value")
> Fixes: d6a427e2c0 ("target/riscv/cpu.c: restrict 'marchid' value")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..70bf10aa7c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1573,9 +1573,9 @@ static void cpu_set_mvendorid(Object *obj, Visitor =
*v, const char *name,
>  static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
>                                void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.mvendorid;
> +    uint32_t value =3D RISCV_CPU(obj)->cfg.mvendorid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint32(v, name, &value, errp);
>  }
>
>  static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
> @@ -1602,9 +1602,9 @@ static void cpu_set_mimpid(Object *obj, Visitor *v,=
 const char *name,
>  static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.mimpid;
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.mimpid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint64(v, name, &value, errp);
>  }
>
>  static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
> @@ -1652,9 +1652,9 @@ static void cpu_set_marchid(Object *obj, Visitor *v=
, const char *name,
>  static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.marchid;
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.marchid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint64(v, name, &value, errp);
>  }
>
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
> --
> 2.41.0
>
>

