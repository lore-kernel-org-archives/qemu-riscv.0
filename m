Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C020C7EE29
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 06:47:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8xni-0003Go-IO; Tue, 13 Jun 2023 02:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8xnf-0003GC-V0; Tue, 13 Jun 2023 02:46:44 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8xnd-0008Jr-MI; Tue, 13 Jun 2023 02:46:43 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-45bcbd77636so1493827e0c.1; 
 Mon, 12 Jun 2023 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686638800; x=1689230800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p33/lqfybUnErs4SFRmt0FIPzHyWBc6NV+aiBjphook=;
 b=nuDMbuevwuLFvXVJIDQn4g6+3pgP7p50SpN9ZwLyrJshZKdvW/f7tKKP++Gx4Sh9IN
 ILaJndXDzB9UKq4SbQKhvq/hQNtl4E9uFz2z/jfmbMfimYYyUwnMB7xQOYpEeHnCOo1L
 2k43H7a+lGiGuTV8UL8cn6OmTcbKgqzkaTbCJVwkzg7swh0Gg+F3uRQGoBQ13GCIuq+H
 GX4kk99zG8tiE7q6u97rzUk9OfJ7ftDG712cAZ6fXvnsPEjScBn+s77IAabod5h1ueth
 yf1VUPdYPIdkZMKi/qpTZl+Wo7sghL4+ZjZczz4PCCYUFbavRAAB9vDfEVHWxXEP/wGR
 3Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686638800; x=1689230800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p33/lqfybUnErs4SFRmt0FIPzHyWBc6NV+aiBjphook=;
 b=aNTcBka+SAFOAK5Vdox8gG30GXeSv5WwrOGiMnW0mx0Hc+2eUvMS1yyytB08zz6q93
 h1ATzE4alhe9doIHEgg+qTnX96FJ0hw9EXDDozIyHAGuEpDOmZmJyYK/KdR3AXFVinZ7
 fyfPiJkzd4EyJ+qLFhCbfSlyC3/JEzShSywFiDOYc3Dk7S0rmJ68xoasr9EZVRsN4K4S
 yRag75W0vdmDsOsqWBY75DxLRR2bZAWE21Eg6ZZ5rIuhBGU7EsjfnlUu6E+lUqfTbJhu
 o40IQadoCDC4vbdfz7SqFVGe96nv8n/kv934FJayVax/QZD7CNMovDHjoVKmNaVogsgI
 jrCA==
X-Gm-Message-State: AC+VfDwng6MQo36ogcTEKGcjBRNYUZ8XcKy4D8pvn+lvDIFsRjtsm6yR
 z/zvgEAhJjEh3iCYYyWWYSoLBa79FGaOegPaqYs=
X-Google-Smtp-Source: ACHHUZ731LfIkypYCZ9Yosw11ICxBLNsdCNYzhFUaktWCQuWN8i4iFbm8dHuhFXncLk1vx0igbZVmD2iYZaxBY56DL8=
X-Received: by 2002:a1f:5f53:0:b0:45c:d69f:bb89 with SMTP id
 t80-20020a1f5f53000000b0045cd69fbb89mr5717195vkb.5.1686638799802; Mon, 12 Jun
 2023 23:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-4-dbarboza@ventanamicro.com>
 <CAKmqyKNm1cH+fqqNKtm6+bKovdCqajoAcbTpWtA7BH=wLK5j+Q@mail.gmail.com>
 <11aee932-be06-ed42-bf7e-09c8e3ed1045@ventanamicro.com>
In-Reply-To: <11aee932-be06-ed42-bf7e-09c8e3ed1045@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jun 2023 16:46:13 +1000
Message-ID: <CAKmqyKO9ysf5domWV_SFr_hex5ZudmiQxEzwqiNXEojpW3ZzPg@mail.gmail.com>
Subject: Re: [PATCH 03/16] target/riscv/cpu.c: restrict 'mvendorid' value
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Tue, Jun 13, 2023 at 4:52=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 6/12/23 00:56, Alistair Francis wrote:
> > On Wed, May 31, 2023 at 5:49=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> We're going to change the handling of mvendorid/marchid/mimpid by the
> >> KVM driver. Since these are always present in all CPUs let's put the
> >> same validation for everyone.
> >>
> >> It doesn't make sense to allow 'mvendorid' to be different than it
> >> is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
> >> any 'mvendorid' they want.
> >>
> >> Change 'mvendorid' to be a class property created via
> >> 'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
> >> macro. This allow us to define a custom setter for it that will verify=
,
> >> for named CPUs, if mvendorid is different than it is already set by th=
e
> >> CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' i=
s
> >> set to an invalid value:
> >>
> >> $ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=3D2
> >> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=
=3D2:
> >>      Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)
> >
> > Is this something we want to enforce? What if someone wanted to test
> > using the veyron-v1 CPU but they wanted to change some properties. I
> > don't see an advantage in not letting them do that
>
> The idea is to keep things simpler for us. As it is today we forbid users=
 to
> enable/disable extensions for vendor CPUs. Doing the same thing for
> mvendorid/marchid/mimpid seems consistent with what we're already doing.
>
> Also, guest software might rely on vendor IDs from the CPU to take certai=
n
> actions, and if the user is free to change the CPU ID from vendor CPUs th=
e
> software will misbehave and the user can claim "I created a veyron-v1 CPU=
 and
> the guest it's like like it's not". Allowing mvendorid and friends to be =
changed
> doesn't do much for users (we forbid enabling/disabling extensions, so wh=
at's
> to gain from changing machine IDs?) and it can be a potential source of b=
ugs.

Fair points. Ok, fine with me then :)

Alistair

>
>
>
> Thanks,
>
>
> Daniel
>
>
> >
> > Alistair
> >
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   target/riscv/cpu.c | 31 ++++++++++++++++++++++++++++++-
> >>   1 file changed, 30 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 72f5433776..bcd69bb032 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -1723,7 +1723,6 @@ static void riscv_cpu_add_user_properties(Object=
 *obj)
> >>   static Property riscv_cpu_properties[] =3D {
> >>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> >>
> >> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> >>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_M=
ARCHID),
> >>       DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIM=
PID),
> >>
> >> @@ -1810,6 +1809,32 @@ static const struct TCGCPUOps riscv_tcg_ops =3D=
 {
> >>   #endif /* !CONFIG_USER_ONLY */
> >>   };
> >>
> >> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> >> +{
> >> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D =
NULL;
> >> +}
> >> +
> >> +static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *na=
me,
> >> +                              void *opaque, Error **errp)
> >> +{
> >> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> >> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> >> +    uint32_t prev_val =3D cpu->cfg.mvendorid;
> >> +    uint32_t value;
> >> +
> >> +    if (!visit_type_uint32(v, name, &value, errp)) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (!dynamic_cpu && prev_val !=3D value) {
> >> +        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
> >> +                   object_get_typename(obj), prev_val);
> >> +        return;
> >> +    }
> >> +
> >> +    cpu->cfg.mvendorid =3D value;
> >> +}
> >> +
> >>   static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >>   {
> >>       RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> >> @@ -1841,6 +1866,10 @@ static void riscv_cpu_class_init(ObjectClass *c=
, void *data)
> >>       cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
> >>       cc->tcg_ops =3D &riscv_tcg_ops;
> >>
> >> +    object_class_property_add(c, "mvendorid", "uint32", NULL,
> >> +                              cpu_set_mvendorid,
> >> +                              NULL, NULL);
> >> +
> >>       device_class_set_props(dc, riscv_cpu_properties);
> >>   }
> >>
> >> --
> >> 2.40.1
> >>
> >>

