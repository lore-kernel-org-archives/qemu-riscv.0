Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D096C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 18:08:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUA4d-0001Tq-05; Thu, 10 Aug 2023 14:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUA4Z-0001Rg-FZ; Thu, 10 Aug 2023 14:07:48 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUA4X-0001UD-Sk; Thu, 10 Aug 2023 14:07:47 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-79d8edd6d99so412326241.3; 
 Thu, 10 Aug 2023 11:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691690863; x=1692295663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zS2ThlXGqny3AbetbYMTzqcXdKeTl1w8/AdLmIEWc5I=;
 b=bepIRWkvnUXE+UEhWS2hwbAi2PSbHQk4NTvh6v+8YsJ5Rvc8mWjU9dlXhp8FufeQpo
 B05+yW0d5ZPEH3/JPREA2uSUSVvGPXywBSeO7btOyu9TVyjJUAUFzzDlIEVPKlTEqfeI
 AZdSdvaghAoOC8nKpQAogR6YoFBDDh5Ch54i49NqMBHPMJVOzn60xdVpjL68H/Ufz/H0
 SsdaGRdmpdTex5l7aqlHdJe5GZwMSN4olE6eaqEMWhH77EHTCIuGG7iVTxTgPUYiUWmg
 TNYAmjlgavQtx5TGZ/f1iguDj6CYZVlw0Nwy+TK3hr6kxeDskzvgDCMSVHprgzcyuES7
 Gpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691690863; x=1692295663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zS2ThlXGqny3AbetbYMTzqcXdKeTl1w8/AdLmIEWc5I=;
 b=F08C0/YSbM/EUZRdgQjsMZELfVJWGMI2ZtYO7SIOy9DCX1K89ULSQ439nbYQUSR/Se
 NDV7OGwkoMVmAO8qQAimsqcCQHuBvWjM2N5aIbi36aZdmn5KWtc+/T8JjSUubRb6ie6t
 MI1wv3yihfZ7OuZ18ELk5T4rz0oIayJzzdBUwZ+xEPR/LUx6yGNXhho2KF2JyPhuYebU
 2YZ5fU14/GyXiyQQzvtoghljxgiicMxlKMpFBLAoI+QJm9H4JaEGKMRzDOjq/NLiztAc
 7cw9EuEgR2WxeOK8YHWlh7YaFvm0bq5tb1jbz428Ivnvrm30br1EdWG20K+EhUVNAJ3C
 R+GA==
X-Gm-Message-State: AOJu0Yy0VDZsBKDDO+oOTkvf8PPr8Xp9UOF2FY+SbEeCiitYXicoQkLV
 7VuAhWyNnBa0Ic55j9vbBe1I1ln+tMPzjjLhsX0=
X-Google-Smtp-Source: AGHT+IESbLKdVjU1l34RucakmSp4hnxEvsiIFcicQyOTT/qnRMixt7OvX3e64/NkKKuXQzKb5Own33uvj0lNF1Oq1XM=
X-Received: by 2002:a67:ba19:0:b0:443:6cb3:ea61 with SMTP id
 l25-20020a67ba19000000b004436cb3ea61mr2814241vsn.18.1691690863050; Thu, 10
 Aug 2023 11:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
 <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
 <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
In-Reply-To: <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 14:07:17 -0400
Message-ID: <CAKmqyKP2jQ1TYFNjMJNJxGqxHgq5fe5RhBhJDiPE1DoBXpf0gw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: zicond: make default
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Tue, Aug 8, 2023 at 6:10=E2=80=AFPM Vineet Gupta <vineetg@rivosinc.com> =
wrote:
>
>
>
> On 8/8/23 14:06, Daniel Henrique Barboza wrote:
> > (CCing Alistair and other reviewers)
> >
> > On 8/8/23 15:17, Vineet Gupta wrote:
> >> Again this helps with better testing and something qemu has been doing
> >> with newer features anyways.
> >>
> >> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> >> ---
> >
> > Even if we can reach a consensus about removing the experimental (x-
> > prefix) status
> > from an extension that is Frozen instead of ratified, enabling stuff
> > in the default
> > CPUs because it's easier to test is something we would like to avoid.
> > The rv64
> > CPU has a random set of extensions enabled for the most different and
> > undocumented
> > reasons, and users don't know what they'll get because we keep beefing
> > up the
> > generic CPUs arbitrarily.

The idea was to enable "most" extensions for the virt machine. It's a
bit wishy-washy, but the idea was to enable as much as possible by
default on the virt machine, as long as it doesn't conflict. The goal
being to allow users to get the "best" experience as all their
favourite extensions are enabled.

It's harder to do in practice, so we are in a weird state where users
don't know what is and isn't enabled.

We probably want to revisit this. We should try to enable what is
useful for users and make it clear what is and isn't enabled. I'm not
clear on how best to do that though.

Again, I think this comes back to we need to version the virt machine.
I might do that as a starting point, that allows us to make changes in
a clear way.

>
> I understand this position given the arbitrary nature of gazillion
> extensions. However pragmatically things like bitmanip and zicond are so
> fundamental it would be strange for designs to not have them, in a few
> years. Besides these don't compete or conflict with other extensions.
> But on face value it is indeed possible for vendors to drop them for
> various reasons or no-reasons.
>
> But having the x- dropped is good enough for our needs as there's
> already mechanisms to enable the toggles from elf attributes.
>
> >
> > Starting on QEMU 8.2 we'll have a 'max' CPU type that will enable all
> > non-experimental
> > and non-vendor extensions by default, making it easier for tooling to
> > test new
> > features/extensions. All tooling should consider changing their
> > scripts to use the
> > 'max' CPU when it's available.
>
> That would be great.

The max CPU helps, but I do feel that the default should allow users
to experience as many RISC-V extensions/features as practical.

Alistair

>
> >
> > For now, I fear that gcc and friends will still need to enable
> > 'zicond' in the command
> > line via 'zicond=3Dtrue'.  Thanks,
>
> Thx,
> -Vineet
>

