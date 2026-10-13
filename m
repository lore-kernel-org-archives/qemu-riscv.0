Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0E0CA9ED2
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 13:02:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGc8s-0002W5-Kr; Tue, 13 Oct 2026 09:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGc87-0002QJ-6p
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 09:01:28 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGc83-0001rn-1x
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 09:01:16 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-35943f55c06so2456886eec.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 06:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896473; cv=none;
 d=google.com; s=arc-20260327;
 b=gq1B9g5Lip8Cotn/CAw2aHOl4Iq2IG5PB9+V7kBq5V7T12tWne9XP76443RGK0lYhB
 eB7dCK0XjJl680l2u6hodP2RvfrLZJlVy1T/Dz7s9TvudoveZDJVIl8Hww0IIMu3pjf5
 Kz45LsNL4y2QfNLWT2Id2OalAbYeB4zGVNsKF4NX/0TXlWXEqUSvnyiyLHMZsNG6eKB0
 JCxFYU0qLfILXXb5T/lZswb10kHqSgeE3hcgkLAx7/Tv9X/9LUovM3XS5LyETP3ATAW1
 ycE0ykpS0jQK5vRcixV6LKdhhqOxWF7Ii1x434gyyNBJJZq+aulcAHnc/abLHEOn+ddR
 8c9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 fh=ud5oTax22CaTZUZeDefi1ymhoMZ4cJKmAdzwdVNO2Qo=;
 b=AlVRSYEBNah2kIRnpugJKL5ChwhnnwOCJLe2gJ0S+ZfoRqWBYdQfP6JOPHInBVxfHy
 45exRW1N9kSFlEnIxmX+vIsQoLyVKVZT9+Svb4MZySAt0d392r4uBlrRmbMJZV+/pxfj
 foDQ6Uwp/90nH9zgfI2bATzQjkqSn1XaDlnXkVecdm671lXaz5dwnmm74tK0ToyGN3bJ
 a3CMyttLB5plp2246jTmLOFyGbUQvfsSiEbu0DGXZojTQA4zSXGQjXbOc1fzEfYB16Z+
 xehQHpV8VAuPmYsuIrM7NC35v1A69IPExsqDLsQkEp1ijzO6g56KkV3sD5kTU5h+Ykph
 O/bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1791896473; x=1792501273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 b=LSuu6ve0vPwQb/oQjwAPPXgPmACPFsusqMi4Gj0Egcen9WUS7bp3tiFyWP68JpBDEB
 VtLWgV25QeqjikqIc9MYhQKuN8jOilt6FF0g3tBcQSyNADCg5TzlFyj4DQr793sZJypv
 sFwjdieXJaijYj1BNe1lO6NXNAY7//MNDFVkyU1wWYAbpjWvi3NkKEbWxEZJ2/wJAiUt
 xxiNf7LT6Zr8gfkb62s1ipLdZuZ0CD2W+6WI7Mg2NHO+SoOE5KmCda6O9tIz8kPF+uMR
 4GKyUPJbLBlkZ0r9M/n2jaRtMZMh8N8jb9amXtLpsGy34wh6zt4xbO5TU+c9cGIC6Dkh
 3JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791896473; x=1792501273;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 b=ib8kw2s1PloNkEwZrepFg0h1ngThgauhW/603zblm5+79ISAQ5s70sQXmAWUAOfB4H
 QXVH+uNFPaSN60ps/K43wnxsxnLoI6YC3h2Za+d1U3qY1tKJjZOQqmLLy3X0PbrVD5nU
 WmiGNlWpNMBpyAogurEEVYcSQi3PU6MF3AszfwfL4Bh7IQCvC2YbG2AbmHzZt5u/Q1ys
 wg8WMUyU5KBc9Sc8ARuUpapnfD+4zd/o+eKjRNDgwhvIXjEW2u6mVqB2ZU0QzAbjjDrh
 lmPi+3q8rw2CleM6tCMJ9ohqtmqfUe49kTS/nW80oBrjE69rHh4EBCR8bdVR7F+gZpDf
 j6GQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzi7Rj4uwZxNtLZvDgU8CulMdBr4MfKlvCIFRHYHsjGnnt0JCU4QaptoPy/iT2iEAYHrW8CF2rKfYci@nongnu.org
X-Gm-Message-State: AFq9FYJ+zpghloGJpRKUnCHArhsMVjKohZ3AFOHyriY+iAVMHHw5Mn1L
 b95XpUKhnmzEHkw0M66vlPphNT//rxACwWWuCPJpA5eUdUMRuUjNnDC2z5mjghkdG++A6KWyJ/G
 NxAPLQJ+H51Si6ZD66j5/drzIX1aM0h4=
X-Gm-Gg: AYBFou1X9hXgidxINABgklGlkKlRKALBIhmw7r9zuXKAwpWj2TYruQ6uxQebKNuSvnl
 j50PJchHYand9vaA/VgFIrsSt2YRGqyMAzTYi9i7YC+icOlzvrukIPmNl0TsGWFw9eN+HeoO5xO
 q3N5ET2vwHUmBwpb1zVovOIzpXSfmHavVRH/zU3r1JnrxP3P7aICX19EvzIuJ7eYPZeXyNgTa6D
 33WnW3U6lpN/WHt8GYBkpKY06ULbe2B0CHs1fzxu73L5p6GFkhMJDFNOU0USpl2lZCBbmpIn4og
 1aS+Io0fmDGHZK3ZfyMSoIuXo0R2RqD+0l4KhHoMeDWauN0t5eVP+oNjp1/7+lfK0h+c3Y8WX8w
 GjbVi3BE/dLg=
X-Received: by 2002:a05:693c:811a:b0:351:7e5d:3caf with SMTP id
 5a478bee46e88-3537dfb8c44mr17683397eec.7.1791896472825; Tue, 13 Oct 2026
 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-query-reg-v2-0-6f95a2e139a9@redhat.com>
 <20261013-query-reg-v2-4-6f95a2e139a9@redhat.com>
 <87ik36gfe6.fsf@draig.linaro.org>
In-Reply-To: <87ik36gfe6.fsf@draig.linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 13 Oct 2026 17:00:59 +0400
X-Gm-Features: AclHuK_blaIwYzH5KQnLuLReYYXS7Ov9FVamAZSe3X0WjS8D3Um413MnIE6moeg
Message-ID: <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Tue, Oct 13, 2026 at 12:51=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Add support for registering coprocessor features that are only visible
> > to QEMU's internal APIs (HMP monitor $register expressions, plugins) bu=
t
> > hidden from GDB's target description XML.
> >
> > When a feature is registered as internal:
> > - It is excluded from the target.xml sent to GDB
> > - Its XML is not served via qXfer:features:read
> > - 'p'/'P' packets for internal register numbers return E14
> >
> > This is useful for exposing system registers to the HMP monitor without
> > affecting GDB's register namespace. Exposing aliases or synthetic
> > registers through GDB's target description can cause problems: name
> > collisions with GDB's pseudo-registers, independent register caching,
> > and missing DWARF unwind rules.
>
> Hmm are they *that* useful for HMP then?
>
> The front-ends do limit what they export to gdb (see for example
> ARM_CP_NO_GDB) generally because reading them causes side-effects. Those
> restrictions are also a reason to limit them from the HMP interface.

I am not a user, but I can imagine they are useful for developers.

I would like to be able to implement "info registers" purely based on
QMP for ex.

>
> >
> > Internal features must be registered after all GDB-visible features to
> > keep remote register numbering consistent. This ordering is enforced
> > with an assertion.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  gdbstub/gdbstub.c      | 71 ++++++++++++++++++++++++++++++++++++++++++=
++------
> >  include/exec/gdbstub.h | 21 +++++++++++++++
> >  2 files changed, 84 insertions(+), 8 deletions(-)
> >
> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> > index 912e31b66744..ac0f76d62333 100644
> > --- a/gdbstub/gdbstub.c
> > +++ b/gdbstub/gdbstub.c
> > @@ -54,6 +54,7 @@ typedef struct GDBRegisterState {
> >      gdb_get_reg_cb get_reg;
> >      gdb_set_reg_cb set_reg;
> >      const GDBFeature *feature;
> > +    bool internal; /* hidden from GDB, accessible via API/monitor */
> >  } GDBRegisterState;
> >
> >  GDBState gdbserver_state;
> > @@ -385,6 +386,11 @@ static const char *get_feature_xml(const char *p, =
const char **newp,
> >              }
> >              for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> >                  r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, =
i);
> > +                /* The core target.xml feature must never be internal.=
 */
> > +                g_assert(i > 0 || !r->internal);
> > +                if (r->internal) {
> > +                    continue;
> > +                }
> >                  g_ptr_array_add(
> >                      xml,
> >                      g_markup_printf_escaped("<xi:include href=3D\"%s\"=
/>",
> > @@ -400,6 +406,9 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
> >      /* Is it one of the features? */
> >      for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> >          r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> > +        if (r->internal) {
> > +            continue;
> > +        }
> >          if (strncmp(p, r->feature->xmlname, len) =3D=3D 0) {
> >              return r->feature->xml;
> >          }
> > @@ -563,13 +572,14 @@ int gdb_write_register(CPUState *cpu, uint8_t *me=
m_buf, int reg)
> >
> >  static void gdb_register_feature(CPUState *cpu, int base_reg,
> >                                   gdb_get_reg_cb get_reg, gdb_set_reg_c=
b set_reg,
> > -                                 const GDBFeature *feature)
> > +                                 const GDBFeature *feature, bool inter=
nal)
> >  {
> >      GDBRegisterState s =3D {
> >          .base_reg =3D base_reg,
> >          .get_reg =3D get_reg,
> >          .set_reg =3D set_reg,
> > -        .feature =3D feature
> > +        .feature =3D feature,
> > +        .internal =3D internal
> >      };
> >
> >      trace_gdbxml_register_feature(feature->name, feature->xmlname,
> > @@ -605,7 +615,7 @@ void gdb_init_cpu(CPUState *cpu)
> >          assert(feature->base_reg =3D=3D 0);
> >          gdb_register_feature(cpu, 0,
> >                               cc->gdb_read_register, cc->gdb_write_regi=
ster,
> > -                             feature);
> > +                             feature, false);
> >          cpu->gdb_next_base_reg =3D cpu->gdb_num_g_regs =3D feature->nu=
m_regs;
> >      } else {
> >          cpu->gdb_next_base_reg =3D cpu->gdb_num_g_regs =3D cc->gdb_num=
_core_regs;
> > @@ -616,20 +626,26 @@ void gdb_init_cpu(CPUState *cpu)
> >                            cc->gdb_num_core_regs);
> >  }
> >
> > -void gdb_register_coprocessor(CPUState *cpu,
> > -                              gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> > -                              const GDBFeature *feature)
> > +static void do_gdb_register_coprocessor(CPUState *cpu,
> > +                                        gdb_get_reg_cb get_reg,
> > +                                        gdb_set_reg_cb set_reg,
> > +                                        const GDBFeature *feature,
> > +                                        bool internal)
> >  {
> >      GDBRegisterState *s;
> >      guint i;
> >      int base_reg =3D cpu->gdb_next_base_reg;
> >
> >      for (i =3D 0; i < cpu->gdb_regs->len; i++) {
> > -        /* Check for duplicates.  */
> >          s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> > +        /* Check for duplicates.  */
> >          if (s->feature =3D=3D feature) {
> >              return;
> >          }
> > +        /* GDB-visible features must not follow internal ones.  */
> > +        if (!internal) {
> > +            g_assert(!s->internal);
> > +        }
> >      }
> >
> >      if (base_reg < feature->base_reg) {
> > @@ -637,12 +653,27 @@ void gdb_register_coprocessor(CPUState *cpu,
> >                                                feature->base_reg);
> >          base_reg =3D feature->base_reg;
> >      }
> > -    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature);
> > +    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature, int=
ernal);
> >
> >      /* Add to end of list.  */
> >      cpu->gdb_next_base_reg =3D base_reg + feature->num_regs;
> >  }
> >
> > +void gdb_register_coprocessor(CPUState *cpu,
> > +                              gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> > +                              const GDBFeature *feature)
> > +{
> > +    do_gdb_register_coprocessor(cpu, get_reg, set_reg, feature, false)=
;
> > +}
> > +
> > +void gdb_register_internal_coprocessor(CPUState *cpu,
> > +                                       gdb_get_reg_cb get_reg,
> > +                                       gdb_set_reg_cb set_reg,
> > +                                       const GDBFeature *feature)
> > +{
> > +    do_gdb_register_coprocessor(cpu, get_reg, set_reg, feature, true);
> > +}
> > +
> >  void gdb_unregister_coprocessor_all(CPUState *cpu)
> >  {
> >      /*
> > @@ -1223,6 +1254,18 @@ static void handle_remove_bp(GArray *params, voi=
d *user_ctx)
> >   * the remote gdb to fallback to older methods.
> >   */
> >
> > +static bool gdb_register_is_internal(CPUState *cpu, int reg)
> > +{
> > +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> > +        GDBRegisterState *r =3D &g_array_index(cpu->gdb_regs, GDBRegis=
terState, i);
> > +
> > +        if (r->base_reg <=3D reg && reg < r->base_reg + r->feature->nu=
m_regs) {
> > +            return r->internal;
> > +        }
> > +    }
> > +    return false;
> > +}
> > +
> >  static void handle_set_reg(GArray *params, void *user_ctx)
> >  {
> >      int reg_size;
> > @@ -1232,6 +1275,12 @@ static void handle_set_reg(GArray *params, void =
*user_ctx)
> >          return;
> >      }
> >
> > +    if (gdb_register_is_internal(gdbserver_state.g_cpu,
> > +                                 gdb_get_cmd_param(params, 0)->val_ull=
)) {
> > +        gdb_put_packet("E14");
> > +        return;
> > +    }
> > +
> >      reg_size =3D strlen(gdb_get_cmd_param(params, 1)->data) / 2;
> >      gdb_hextomem(gdbserver_state.mem_buf, gdb_get_cmd_param(params, 1)=
->data, reg_size);
> >      gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf-=
>data,
> > @@ -1248,6 +1297,12 @@ static void handle_get_reg(GArray *params, void =
*user_ctx)
> >          return;
> >      }
> >
> > +    if (gdb_register_is_internal(gdbserver_state.g_cpu,
> > +                                 gdb_get_cmd_param(params, 0)->val_ull=
)) {
> > +        gdb_put_packet("E14");
> > +        return;
> > +    }
> > +
> >      reg_size =3D gdb_read_register(gdbserver_state.g_cpu,
> >                                   gdbserver_state.mem_buf,
> >                                   gdb_get_cmd_param(params, 0)->val_ull=
);
> > diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> > index 75eb4d9c365e..1bc778324758 100644
> > --- a/include/exec/gdbstub.h
> > +++ b/include/exec/gdbstub.h
> > @@ -40,6 +40,27 @@ void gdb_register_coprocessor(CPUState *cpu,
> >                                gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> >                                const GDBFeature *feature);
> >
> > +/**
> > + * gdb_register_internal_coprocessor() - register internal registers
> > + *
> > + * Like gdb_register_coprocessor(), but the feature is NOT exposed to
> > + * GDB via the target description XML. The registers are only
> > + * accessible through QEMU's internal APIs (HMP monitor ``$register``
> > + * expressions via gdb_get_register_list()).
> > + *
> > + * Internal features must be registered after all GDB-visible features
> > + * to avoid register numbering mismatches with GDB.
> > + *
> > + * @cpu - the CPU associated with registers
> > + * @get_reg - get function
> > + * @set_reg - set function
> > + * @feature - the GDBFeature describing the registers
> > + */
> > +void gdb_register_internal_coprocessor(CPUState *cpu,
> > +                                       gdb_get_reg_cb get_reg,
> > +                                       gdb_set_reg_cb set_reg,
> > +                                       const GDBFeature *feature);
> > +
> >  /**
> >   * gdb_unregister_coprocessor_all() - unregisters supplemental set of =
registers
> >   * @cpu - the CPU associated with registers
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

