Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D97C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 01:21:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAgbG-0004Ef-N9; Tue, 05 Dec 2023 20:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1rAgbF-0004EW-Li
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 20:21:17 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1rAgbD-000760-J6
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 20:21:17 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f751663bso43971051fa.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Dec 2023 17:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1701825673; x=1702430473; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3/Vwal/9VhYPZLaVj4KiOzjzd2yQ6ht3KJy7c3oH7I=;
 b=gujnfSXlKEhLaQ3KmSXJbvDzIHwFCillIwlEILo3VCadGc48QsyaK5ygFH2AqNx37v
 RfGcYVVsFRQzc5aydPHxkPZ82loGIFthpQOmVkFMmZir/UmOTgKxTz13HMqBbpJATfiV
 CfCaS1Cya2O4GX9KagVk7K6oaD0kYgj0ZfqQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701825673; x=1702430473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3/Vwal/9VhYPZLaVj4KiOzjzd2yQ6ht3KJy7c3oH7I=;
 b=IU6Ok3fCZPZyc6tVRtoeX/JyxMWbkCwDpF1IL6hGQPSNQ196dzC17KwY4+ufOLbNIm
 9TgX1C67PLWs5w0+5ledi/Z0zd+PTIp53g8kCtiz6V+1Fc2WbT/VtgMFSp1Gl3uJe6NN
 AsILNAOiKVrciGWGxcpncJ1CsEMum6kIP9wnpiF40F9g6AnpyEI6Q5VDM/+mgFfSNbdD
 1v4VnXCoLymWXnFaKryXy6UgN4+i9ywhE3Mc1XKlA0pkYHvI/A7in74ZyiP2FwsQD8zn
 TD15L20HhPSS1/2CPsE1KPOoEsJBS1UBQsV0ww7IUcY7J5pgfDsu6hmX0jrsVSSGtFWn
 gGWQ==
X-Gm-Message-State: AOJu0Yzx2k8PX6SxG0TImokbuuQT/eA3hrMj4B3leYUxlwRI0x3cgY3I
 ECwlXMXXtUzB4YNQPJaDngcy5NdxO7bxse6+f1LfAU3bRos4xrF5+A==
X-Google-Smtp-Source: AGHT+IHXBmteqftGV/ac3mh1ysWLNeNeSwxpFp4Vwg1+ThN1B6GQHE4qdu54pXJc8rmi9wZ7GcWP0jHdon0DmT7iqYg=
X-Received: by 2002:ac2:538d:0:b0:50b:ff2a:8847 with SMTP id
 g13-20020ac2538d000000b0050bff2a8847mr41542lfh.165.1701825672791; Tue, 05 Dec
 2023 17:21:12 -0800 (PST)
MIME-Version: 1.0
References: <25092274-76c6-4d34-a3c4-cae3214bc277@Spark>
 <CAOnJCUL_kg08aQoNosbTgT64O508kQ58-MtT29fBsD+f8dqyoQ@mail.gmail.com>
 <61ae4c15-c251-43a6-aa98-b12ea5feb246@Spark>
In-Reply-To: <61ae4c15-c251-43a6-aa98-b12ea5feb246@Spark>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 5 Dec 2023 17:21:01 -0800
Message-ID: <CAOnJCUK3eVTwPG4VTCpw0kzwqLMO0RMcYAcb1vDjdKrum38MYw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_About_RISCV=E2=80=99s_Performance_Counters_and_QEMU?=
To: Elio Vinciguerra <eliovinciguerra@me.com>
Cc: ELIO VINCIGUERRA <elio.vinciguerra@phd.unict.it>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=atishp@atishpatra.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Dec 5, 2023 at 4:56=E2=80=AFAM Elio Vinciguerra <eliovinciguerra@me=
.com> wrote:
>
> Thanks for your answer, do you know if the working ones return actual or =
random numbers?
>

It depends on your definition of reality :). For cycle/insteret, it
returns host_ticks by default.
For the other three events, we rely on the riscv_cpu_tlb_fill() function.

Both cases it is not close to what you would actually see in hardware.
However, we need something
to build the software ecosystem in absence of real hardware.

I don't know your requirements for running in Qemu. However, if you
can use real silicon, there are few
RISC-V hardware that have decent support for PMU.
 HiFive unleashed, Alibaba D1 and Andes AX45MP core (with inflight patches)

> And do you know if it is easily possible to implement the actual behavior=
 of other counters?
>

You mean events ? AFAIK, the problem is there is no easy way to
emulate any other event. I would be happy to be proven wrong though.
Once you find a way to emulate other events, supporting them is pretty easy=
.

> Regards,
> Elio
> Il 4 dic 2023, 9:30=E2=80=AFAM +0100, Atish Patra <atishp@atishpatra.org>=
, ha scritto:
>
> On Fri, Dec 1, 2023 at 7:57=E2=80=AFAM ELIO VINCIGUERRA
> <elio.vinciguerra@phd.unict.it> wrote:
>
>
> Hi everybody, I recently started using RISCV architectures, I would need =
a way to access =E2=80=9Chpmcounter[3-31]=E2=80=9D registers using QEMU emu=
lator.
>
> The kernel used for simulations is a C program, not a heavy operating sys=
tem, which is why I would need to access the registers mentioned before via=
 assembly.
>
> Trivially accessing any of those registers always returns zero.
>
> The question is:
> Are these registers enabled in QEMU? If not, is it possible to enable the=
m or are they hardwired to zero? How?
>
> Trying to access the registers =E2=80=9Ccycle=E2=80=9D, =E2=80=9Cinstret=
=E2=80=9D and =E2=80=9Ctime=E2=80=9D the values come out to be non-zero, wh=
ich is why I think it is also possible to enable =E2=80=9Chpmcounter[3-31]=
=E2=80=9D, but the mode of operation is unknown to me, can anyone help me?
>
>
> Yes. You can use all the hpmcounters[3-31]. By default,
> hpmcounter[3-18] are enabled. You can modify the set of counters using
> pmu-mask cpu property.
> https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/cpu.c?ref=
_type=3Dheads#L1467
>
> However, upstream Qemu doesn't support a lot of PMU events. It only
> supports 3 cache related events apart from cycle/instret.
>
> Here are the events it supports.
> https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/pmu.c?ref=
_type=3Dheads#L36
>
> Regards,
> Elio
>
>
>
>
> --
> Regards,
> Atish



--=20
Regards,
Atish

