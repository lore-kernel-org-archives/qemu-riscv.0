Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE1CD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 00:58:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNYR-0007XP-BB; Tue, 10 Oct 2023 20:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNYP-0007Vu-7l; Tue, 10 Oct 2023 20:58:25 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNYN-0005Om-GB; Tue, 10 Oct 2023 20:58:24 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7b5f0bbe137so699844241.2; 
 Tue, 10 Oct 2023 17:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696985901; x=1697590701; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A57TM/3+3Y4XB6+NXinNYH6inAvqYR+M0a5QwRks3Bg=;
 b=Zhvy/5uuCkK19q/3FkBsxk4nOjXJrkik+2wjOYWMjoRGEOMGeyYsbE/r9BvhSxCrge
 70SIoU8f490nsXCyPNcpKofSocg8ilnpF29HA/j4aSExJfmsCgO46kSDJNcGFgrde0Uj
 e8rMAe9S8obt2+qxicS6PBKmz/zYJlHqU+wWpIEzFASG2K3oPMODW9H/ee9C5r+rqcwJ
 hSsv5nTOzqiBI5IA8qGzBzM3/lnJzAjstIaon6htdP9vI0SV1L8IAF3mlgZWc4+3s4MR
 I+J+smVU9FMqPFcFpjmqM9W0Qvkqx9BpwFzUk5OyIhIYX1FBrGXj1E+zYOc6mrVJfoJp
 EZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696985901; x=1697590701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A57TM/3+3Y4XB6+NXinNYH6inAvqYR+M0a5QwRks3Bg=;
 b=gLOrRDLovffsdgNbLtMb5dfvKRHq+rtfGgkSm5xQCVQwAc3eNF6H7h/bP4WbxQbNTg
 WJGcY1b16TJTAohlOYGPPo7eeb3PmVPIS17BIXTHPaSU+Z0ZOZOIQqzYAl8HuETStN5/
 vSpMT8psqaoekETkToUBiuIG4SPMcvq+VkE84XiTo1+pzZ7qkElF9mIoKhc+LDSbzMLg
 h72F+SO6FOe9aMVuyHpYYDf40UPxJiI0fSW4D0KoYLT7CQ1xqDIGbnlSbHn1wJ7dWAhr
 yB4470xKZIQ0wglYU+ig4yWznw1jU9nCj/L8mzUPzHzpR2jmrP6nSkD1nEsOUfRlYvt0
 YRYw==
X-Gm-Message-State: AOJu0YwSXb8KhtMHVoOA43YugHpaTcenzw0XzihGgRFo/0GisqH2jn1I
 m9cDeR7sdvsN9KPVeJn+wNN1deeSY4BisRUqNkM=
X-Google-Smtp-Source: AGHT+IF1/cGebYEyPjv1zp7eYAb2uu01zcnezyBsF/1P9pm03X3N0T/+xSZ0wkvVYuuaOpnngMp2DUm51frLL3M8bdk=
X-Received: by 2002:a05:6102:4a5:b0:44d:5a92:ec40 with SMTP id
 r5-20020a05610204a500b0044d5a92ec40mr19039711vsa.24.1696985901084; Tue, 10
 Oct 2023 17:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-20-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-20-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:57:54 +1000
Message-ID: <CAKmqyKMa1FU=gvOg8XVsexD6KoF_aZLU7Z=P=dExz3vu4sTEsA@mail.gmail.com>
Subject: Re: [PATCH 19/25] gdbstub: Replace gdb_regs with an array
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Tue, Oct 10, 2023 at 2:47=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> An array is a more appropriate data structure than a list for gdb_regs
> since it is initialized only with append operation and read-only after
> initialization.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20230912224107.29669-13-akihiko.odaki@daynix.com>
> [AJB: fixed a checkpatch violation]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h |  2 +-
>  gdbstub/gdbstub.c     | 35 +++++++++++++++++++++--------------
>  2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 7b8347ed5a..3968369554 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -502,7 +502,7 @@ struct CPUState {
>
>      CPUJumpCache *tb_jmp_cache;
>
> -    struct GDBRegisterState *gdb_regs;
> +    GArray *gdb_regs;
>      int gdb_num_regs;
>      int gdb_num_g_regs;
>      QTAILQ_ENTRY(CPUState) node;
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 62608a5389..b1532118d1 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -51,7 +51,6 @@ typedef struct GDBRegisterState {
>      gdb_get_reg_cb get_reg;
>      gdb_set_reg_cb set_reg;
>      const char *xml;
> -    struct GDBRegisterState *next;
>  } GDBRegisterState;
>
>  GDBState gdbserver_state;
> @@ -386,7 +385,8 @@ static const char *get_feature_xml(const char *p, con=
st char **newp,
>                  xml,
>                  g_markup_printf_escaped("<xi:include href=3D\"%s\"/>",
>                                          cc->gdb_core_xml_file));
> -            for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +            for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +                r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i)=
;
>                  g_ptr_array_add(
>                      xml,
>                      g_markup_printf_escaped("<xi:include href=3D\"%s\"/>=
",
> @@ -430,7 +430,8 @@ static int gdb_read_register(CPUState *cpu, GByteArra=
y *buf, int reg)
>          return cc->gdb_read_register(cpu, buf, reg);
>      }
>
> -    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +        r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>          if (r->base_reg <=3D reg && reg < r->base_reg + r->num_regs) {
>              return r->get_reg(env, buf, reg - r->base_reg);
>          }
> @@ -448,7 +449,8 @@ static int gdb_write_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
>          return cc->gdb_write_register(cpu, mem_buf, reg);
>      }
>
> -    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +        r =3D  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>          if (r->base_reg <=3D reg && reg < r->base_reg + r->num_regs) {
>              return r->set_reg(env, mem_buf, reg - r->base_reg);
>          }
> @@ -461,17 +463,23 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                int num_regs, const char *xml, int g_pos)
>  {
>      GDBRegisterState *s;
> -    GDBRegisterState **p;
> -
> -    p =3D &cpu->gdb_regs;
> -    while (*p) {
> -        /* Check for duplicates.  */
> -        if (strcmp((*p)->xml, xml) =3D=3D 0)
> -            return;
> -        p =3D &(*p)->next;
> +    guint i;
> +
> +    if (cpu->gdb_regs) {
> +        for (i =3D 0; i < cpu->gdb_regs->len; i++) {
> +            /* Check for duplicates.  */
> +            s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +            if (strcmp(s->xml, xml) =3D=3D 0) {
> +                return;
> +            }
> +        }
> +    } else {
> +        cpu->gdb_regs =3D g_array_new(false, false, sizeof(GDBRegisterSt=
ate));
> +        i =3D 0;
>      }
>
> -    s =3D g_new0(GDBRegisterState, 1);
> +    g_array_set_size(cpu->gdb_regs, i + 1);
> +    s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>      s->base_reg =3D cpu->gdb_num_regs;
>      s->num_regs =3D num_regs;
>      s->get_reg =3D get_reg;
> @@ -480,7 +488,6 @@ void gdb_register_coprocessor(CPUState *cpu,
>
>      /* Add to end of list.  */
>      cpu->gdb_num_regs +=3D num_regs;
> -    *p =3D s;
>      if (g_pos) {
>          if (g_pos !=3D s->base_reg) {
>              error_report("Error: Bad gdb register numbering for '%s', "
> --
> 2.39.2
>
>

