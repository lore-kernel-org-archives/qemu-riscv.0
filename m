Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C728CD6E55
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTssm-0005bX-0F; Sun, 31 May 2026 23:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTssk-0005bF-Nm
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:00:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTssj-0007nu-0z
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:00:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68cc6c7df99so1945582a12.1
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780282799; cv=none;
 d=google.com; s=arc-20240605;
 b=PTPUuCpoXS0ykL4id6TFEXkO/LzzveRmzIPu6nr23lCbrt9n4zYWuzWbtKkHpkG3MB
 DTE061/VkFdrzQrU9OYGPk7cfXWjSgEi4q8PjlzhYYSOjehLXrrVB2ijx92kAR+BWmJo
 WtqLLQ5bKGVBbWaMln57t4A4JMX7dAjvOxBnjXzcCn96M4Pm4WDgtBdy1QxicZTb+uS6
 lOzBD2w/pltC0+m10c49M96Z3rtCeJdGQramSdxif/qlp1vP8K1/ILQD8EHcdqzIXwiT
 c5DUJMPjjQLBceOIvBQj0Be+QGqiiuZ9QXIUVPlkunJcy8YJY0arHR0dpEj9aumrPK76
 5/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QLX9+EYFM3nE7I+Q/Fv7EEouKg8wEhBeG1tpi80JU2c=;
 fh=BF0AG2t4ujZJaWgQwcR5iW2mnP2JTZQOBXjxYebpE94=;
 b=MxR7FjTsYrmtJw03ZTotRRu0N+vWVp0jR3Zt67ykvI1GuR2slhNk0tUEZVz3OcaEgV
 1bsyvtvKaMzOjjdnV29Q3f/IredFIR26+3zmbA58+8VuzZkCWhKLFYMomqIkYGcbizfz
 dnsX8FTWJYOykD9tmK2m8rtAmjtSnx5mz6DoXVTXu5RwMPzAH/GFd1T1rt4+tum0YevH
 Qaif782J4w25VG9wu1Q7qPr+v/5E8LI8hUYg643rZqWAW+mTduNoDcuOZ1jdb2YbI4/Z
 KSIbc08F/ZFJwGnIBXfTVl13aGydi7bm2x3lGtvYsANrqc5T6f2vGxjMlpzs8rqnyyRY
 tU1Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780282799; x=1780887599; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLX9+EYFM3nE7I+Q/Fv7EEouKg8wEhBeG1tpi80JU2c=;
 b=dVTcKSEaAwMdTlvkwGgN6RFuKszVLMXtN27wAuby4AqNwSV9JjOXtcwooJ20azU0ED
 1tuyChMRh8rePh1xhEj2dqpeONWyWt10eSHZlDEgrrh4FPVh2dnylPlPLcxePVWeJisP
 arjATW4Z+nQ0Iy0LACTUNcjUQZlM9AAkoojJF/QHGJJLvjWgu4ilFAQ0jXrKp181bv7S
 RSYMO7ZD8WPVxHJtA85NIyXaQ8NdUKZRWoHMirUCKvz9PQUoDz8/whhmwywkoCLVBztl
 ccKqBb6Og6x+cYWdjS2jZIgzKDSaJbAUddr9b8G8vCo8mqwGuq9UinayssKDcosJ9OFr
 2kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780282799; x=1780887599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QLX9+EYFM3nE7I+Q/Fv7EEouKg8wEhBeG1tpi80JU2c=;
 b=qyJWxkrPqPNaJ7xmTywpUSxoHmeFu4IPlUB0ph8eL3a8Z6pxM9LmPn2U2Kml0O1bnw
 CTPMkh3HySoZFINWaTHYVD+WaEzLdeeFrxfqrSQp5aPUfL1vbc42cpsSGFyPevUmUAhO
 DsT8HAxYuI2O6CS2Gv7AKx4HZJTJOTiMKD/qfUT7P8dZXuIkTS+4DGMdF5VuvsWQ9v6k
 LVZwR98rDriJ/ZDVGbuOU/Le6wP7ajcLadyf1ftnI0sKvMJuuxJg0inGF/TPDu4wHrwI
 Rpcn+DEoVKBhPT1stFNU0J6CjaC84KKuHiPa4KJaQX/DPYLmXHx94tH+mdL1jEAAP7E6
 4QkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+AAXgJiUsWO/Fm1YVcbLNA/4Xe+lWTK30SL3HEs43wGxZnSffpe70hoAIk6oc9/yjrcYPbHEbMVY75@nongnu.org
X-Gm-Message-State: AOJu0YxBVa6tP0qzOgVK4hZvnGYwJ6cDbx7UfBP2JptxpEslI2YrxvJn
 GV3qzZ+gHfTVLya+bWW8QIKjsrfynrI1Jce2WaQG3PvyXrRPHtdcrERzKM0DljqMJYeOK82+myy
 CfoJ93bfL2ONMgpmMpK/Lo4BzYJYjft0=
X-Gm-Gg: Acq92OGVcwCFXAesAj4h2dHT6giUsLFLShbKSnFADqzXNP5atZlXyCHq99of9j4j942
 mXnskPkZ5HBRGkwO09CK204hVc4GgQO3RdAbo+Q4QvnO6TfIhwPcE8MdItD0Lag69+9MgTcXsr3
 zDX9pDxeXa+VAtFDIMuukiMOp3pQw5CL4gIalzYDXUBfT9TgjCtdjWwQHxDPmdBH2uE6zRlBFL2
 zPStrbeJPXIhgeps0oyuzm3G5ybZHLdgxFsUCOK7htyokCxNbb5rYXXynSOKjbpvXQEVACxSTcn
 8nlmvu5eHMPuoxUizbroVdlhVIAXk86g3HvjmtnZD983dsV0
X-Received: by 2002:a17:907:a602:b0:bb4:92dc:b84b with SMTP id
 a640c23a62f3a-beab77bcf3amr488956266b.26.1780282798274; Sun, 31 May 2026
 19:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260514204640.2540054-1-daniel.barboza@oss.qualcomm.com>
 <20260514204640.2540054-3-daniel.barboza@oss.qualcomm.com>
 <agdgwnLqvEeMoeqk@lima-default>
 <174f03b2-b979-47d2-aec8-645d797ab758@oss.qualcomm.com>
 <iglchyedne3jhwr6n4b2ayhqtvyubjpha23kxtobuayjkts4xp@vlzvv3iok36o>
In-Reply-To: <iglchyedne3jhwr6n4b2ayhqtvyubjpha23kxtobuayjkts4xp@vlzvv3iok36o>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 12:59:31 +1000
X-Gm-Features: AVHnY4LahXTgGX4cKYCsDDVyPsTo2_DwyaC9GgSjZuA4YJUfLOismVhnfgSOS60
Message-ID: <CAKmqyKN+vKPOpm=N+Z3Pizo-72q=0Z0+aXx0mVO-JVW=UyPAhg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] target/riscv: Add server platform reference cpu
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 leif.lindholm@oss.qualcomm.com, Fei Wu <wu.fei9@sanechips.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Mon, May 18, 2026 at 6:26=E2=80=AFAM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> On Fri, May 15, 2026 at 04:54:43PM -0300, Daniel Henrique Barboza wrote:
> >
> >
> > On 5/15/2026 3:15 PM, Nicholas Piggin wrote:
> > > On Thu, May 14, 2026 at 05:46:38PM -0300, Daniel Henrique Barboza wro=
te:
> > > > From: Fei Wu <wu.fei9@sanechips.com.cn>
> > > >
> > > > The harts requirements of RISC-V server platform [1] require RVA23 =
ISA
> > > > profile support and others.
> > > >
> > > > This patch provides a new "riscv-server-ref" CPU to go along with t=
he
> > > > future "riscv-server-ref" board.
> > >
> > > About compatibility, if we get a server platform spec v2.0 that requi=
res
> > > a different machine and RVA28 + Sxxx CPU. Is the plan to update these=
,
> > > or add a new CPU and machine types? If the latter, then perhaps a
> > > version in the names like riscv-server-v1.0 / riscv-server-v1.0-cpu
> > > would be good.
> >
> > Good question.  We can get away with machine props to change the board
> > behavior based on spec version but not sure if this makes sense with
> > a CPU.  I suppose we could live with:
> >
> > -cpu riscv-server-ref,spec1.1=3Don
> >
> > to change the CPU setup to v1.1 and so on, but creating a new CPU with =
the
> > spec version in the name like you suggested (e.g. riscv-server-ref-v1.1=
)
> > seems cleaner.  In particular if the spec doesn't change that much - wh=
ich
> > I guess it's fair to assume given that a reference spec wouldn't be muc=
h
> > of a reference if it keeps changing/updating all the time ...

I'm not holding my breath here, I think we should do something

>
> How about we make the platform spec version properties global properties =
so
> they can cleanly apply to both the machine model and the cpu model?
>
>  -global platform_spec_1_0=3Don -machine riscv-server-ref -cpu riscv-serv=
er-ref

That's not a bad idea

Alistair

>
> Thanks,
> drew
>

