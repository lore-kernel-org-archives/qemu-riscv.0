Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8584DC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 08:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rA4Li-0000IA-IA; Mon, 04 Dec 2023 03:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1rA4La-0000H9-8h
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 03:30:39 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1rA4LW-0007Dm-RG
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 03:30:33 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bf7bc38c0so710557e87.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 00:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1701678627; x=1702283427; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEfLTiuNEaz7YXiCQswuc4VZDMxsBjSPx0hNxD/CLHI=;
 b=FaG2WuOI0Jm9DKq7j90c3mJEpZVHmwOQAYr/HO6O0e6V9oC1VhrzXs+VFUdTS+7hxX
 4SpX/QE5oDRLAjvE4dsLTjjqoC0q2nqM4u4NCB8oJQCvsyJzUTrBuA92H6ztZ0Vz2KG4
 XlbbEwUuYUMPUTr+z5f54KKYuZpScrXmIg/vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701678627; x=1702283427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEfLTiuNEaz7YXiCQswuc4VZDMxsBjSPx0hNxD/CLHI=;
 b=C888M0IwGc/QVZ2fzrWmls/9xb3ct+ErKeZWTTYE2lCXSc/biXcQdor1iRADLElxGl
 6dAr48zHiN5Gk33EP3EQYRW87ajhnRe9ziMr89S+R1/S73D+snC0qwf0RxWBkiKDr/Ng
 6zXHH8jzYq4faWbMtG+4ftaSrEdlDshLdaOPrE+jNLMjgC/O6L9qJfbEIDXfyih8gzSP
 EcrPlehFcU4t1YqUp8wV4S60CWqpaCQwIcVLGjMNIVQ3hcFSPo6fuLSCrmWJKVvii0pu
 oQb5GY1BpESsVCxMN5BOm/0kcs5rjZ/YLO4JqLml1yQrJ3tp5lbRcmTXWSStio2X2eNE
 A/6g==
X-Gm-Message-State: AOJu0YxQnZxxoCBrPO+Vk8ivbxV/H1U0pjR+ELH/w/pztoL2AbiEFPuu
 RT538ZU/+oCbO9CF0ZpDSrzUTQN6rzVA9bnvOQUs
X-Google-Smtp-Source: AGHT+IEFEK4rXmyUv/ZQn06Zvl3EMsrCF86/Hf6ys/kC+r8EW386azk1NaQjrn9QaW+VJoSJFSFfhcW6Lguek1olHD8=
X-Received: by 2002:ac2:5333:0:b0:50b:eef5:55fa with SMTP id
 f19-20020ac25333000000b0050beef555famr845487lfh.30.1701678625883; Mon, 04 Dec
 2023 00:30:25 -0800 (PST)
MIME-Version: 1.0
References: <25092274-76c6-4d34-a3c4-cae3214bc277@Spark>
In-Reply-To: <25092274-76c6-4d34-a3c4-cae3214bc277@Spark>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 4 Dec 2023 00:30:14 -0800
Message-ID: <CAOnJCUL_kg08aQoNosbTgT64O508kQ58-MtT29fBsD+f8dqyoQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_About_RISCV=E2=80=99s_Performance_Counters_and_QEMU?=
To: ELIO VINCIGUERRA <elio.vinciguerra@phd.unict.it>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x136.google.com
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

On Fri, Dec 1, 2023 at 7:57=E2=80=AFAM ELIO VINCIGUERRA
<elio.vinciguerra@phd.unict.it> wrote:
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

Yes. You can use all the hpmcounters[3-31]. By default,
hpmcounter[3-18] are enabled. You can modify the set of counters using
pmu-mask cpu property.
https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/cpu.c?ref_t=
ype=3Dheads#L1467

However, upstream Qemu doesn't support a lot of PMU events. It only
supports 3 cache related events apart from cycle/instret.

Here are the events it supports.
https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/pmu.c?ref_t=
ype=3Dheads#L36

> Regards,
> Elio



--=20
Regards,
Atish

