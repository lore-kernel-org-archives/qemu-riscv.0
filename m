Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C66CD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 00:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNZU-0008NB-RC; Tue, 10 Oct 2023 20:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNZR-0008Jf-VV; Tue, 10 Oct 2023 20:59:29 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNZO-0005XX-IU; Tue, 10 Oct 2023 20:59:28 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-4527d65354bso2612059137.0; 
 Tue, 10 Oct 2023 17:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696985964; x=1697590764; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiHimnSOdfouU1hxVB7+hfSpbhB4p+Hd2Gk3DBN4GHg=;
 b=Cn4Cg5/8dGx1HezhRy7uX9G4Odifwuq81wzftm0iYBBZUryTvvnam5hZVsWwJcCkrO
 HeKnIPjc0FqvVDv4PE6ccZUpsnYyRb7c6BPwp8Ye8hv/qhQ9qE27Hm20YoNaEl8Qbrvy
 VxDvFKhMgAe+7JnuHvBCxqritNmln2taTmk8kTl6vurnolN4W8veAM30ZfMMTJ6sFeFW
 DLINXUlsAPpZz6CHtnUWF+vBO+I9X+jl0DGuZn8qviOmd1nEm/JTgOEL5HNLaQm2HSeK
 VwmctHzcGDd01dfr9hRhjmVOS7jLmJLYyyEehPxX26spQ9+i9+DL/sCR5a5nkdUGfCl2
 TGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696985964; x=1697590764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AiHimnSOdfouU1hxVB7+hfSpbhB4p+Hd2Gk3DBN4GHg=;
 b=F1PX/4Bs6aS7YIq7+Pt6HaYufs50O+SeGtbIEqxNHi5PuyA/rBp5YRIg6ldC0v/IRe
 I/HFbLf0dHGRXlDOmiHaph2rC94UYQaiUPNwE5gkdscsOCgkol5LmmdPGRA++3Rp4m4S
 qFDds4Ax/ACcG33gmqqLO5W10uiKdgxSkvigX1FskubCSGoqXtdFZiM9m/ii615My4vi
 7XofKWu814jk4+TYEmmBO99eNsmysN+uFxehHKCkQvtpb+L9UzHZcEtpk2Uzj0q/d/qh
 XjjLFUrsTqAIGp3Nz/hp9cFWfxfGeICWdVIQKhTlMBZi4Ak8NZ6hlC/cNZ9BGtqs+thX
 V3qQ==
X-Gm-Message-State: AOJu0YwJ9g0gf4Z9jQZuc5TZk0NLEjS9eVhpJ0JJ+pVd8N+aLxVVsG70
 5BFlopPIB2riqm3jDBEB8c7/f4BEEaR6mcaEZjY=
X-Google-Smtp-Source: AGHT+IHOIr450w9NLLZ+zgffqfq4SibYaIn0zDubLAlZ3IDzLmTLav264biEDLW2tF8znth7O6gKXC+I6pyqX6B8rTo=
X-Received: by 2002:a67:f7c1:0:b0:44e:d6c3:51d4 with SMTP id
 a1-20020a67f7c1000000b0044ed6c351d4mr17411610vsp.18.1696985964176; Tue, 10
 Oct 2023 17:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-19-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-19-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:58:57 +1000
Message-ID: <CAKmqyKNJ4qm_BG-jh_RghJ3jMSJ6DK=s6L6xVdjr5YW8UMSV9w@mail.gmail.com>
Subject: Re: [PATCH 18/25] gdbstub: Remove gdb_has_xml variable
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Tue, Oct 10, 2023 at 2:48=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> GDB has XML support since 6.7 which was released in 2007.
> It's time to remove support for old GDB versions without XML support.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20230912224107.29669-12-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/internals.h    |  2 --
>  include/exec/gdbstub.h |  8 --------
>  gdbstub/gdbstub.c      | 15 ---------------
>  3 files changed, 25 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index fee243081f..7128c4aa85 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -32,8 +32,6 @@ enum {
>  typedef struct GDBProcess {
>      uint32_t pid;
>      bool attached;
> -
> -    /* If gdb sends qXfer:features:read:target.xml this will be populate=
d */
>      char *target_xml;
>  } GDBProcess;
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 705be2c5d7..1a01c35f8e 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -45,14 +45,6 @@ int gdbserver_start(const char *port_or_device);
>
>  void gdb_set_stop_cpu(CPUState *cpu);
>
> -/**
> - * gdb_has_xml() - report of gdb supports modern target descriptions
> - *
> - * This will report true if the gdb negotiated qXfer:features:read
> - * target descriptions.
> - */
> -bool gdb_has_xml(void);
> -
>  /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
>  extern const GDBFeature gdb_static_features[];
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 3dc847f835..62608a5389 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -349,11 +349,6 @@ static CPUState *gdb_get_cpu(uint32_t pid, uint32_t =
tid)
>      }
>  }
>
> -bool gdb_has_xml(void)
> -{
> -    return !!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml;
> -}
> -
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     GDBProcess *process)
>  {
> @@ -1086,11 +1081,6 @@ static void handle_set_reg(GArray *params, void *u=
ser_ctx)
>  {
>      int reg_size;
>
> -    if (!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml) {
> -        gdb_put_packet("");
> -        return;
> -    }
> -
>      if (params->len !=3D 2) {
>          gdb_put_packet("E22");
>          return;
> @@ -1107,11 +1097,6 @@ static void handle_get_reg(GArray *params, void *u=
ser_ctx)
>  {
>      int reg_size;
>
> -    if (!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml) {
> -        gdb_put_packet("");
> -        return;
> -    }
> -
>      if (!params->len) {
>          gdb_put_packet("E14");
>          return;
> --
> 2.39.2
>
>

