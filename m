Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544DFC61DE2
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 01:57:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0rH5-0000Dw-8J; Sun, 30 Aug 2026 21:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rH4-0000Dc-BY
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 21:57:26 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rH0-0004vx-Vq
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 21:57:26 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66e63c2c9e1so910810d50.0
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 18:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788141441; cv=none;
 d=google.com; s=arc-20260327;
 b=Uqji+LiCIA4s8M3kdurdk9NMHyNQQvT23XGJQlMeHezmKMDKDwmtkSkQVtbItzNZfp
 Jc4HD7FjiN9jQFZHhc3q3NqQFUGu5gTPQKNk0kvB4KZzlZfWd45u7cnEODNLPTCPT+pb
 WOREK7Z56ua0rH5Jk4z6F9F+r7gMshm08tSIfgYGiQLQ/rUUfH/got2p8tBfPJL3ckbD
 RKsjmmAGC0pUvky4rk66nDUpfTMdETxvy+3xuidQ6Mpc6GKDjuC8LSqKQAqDulnj5tG9
 zrho6RmIKqjv+rZeQZkjfE8YNS0hHFqg1DDipvuX5/LUhsNH9yh4PD51xx7c9bj5LQPW
 2ipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EHWkIpJjbvCM8i9EVzGkfSqsE5M0tKBuD6Cyeoh+D9k=;
 fh=NF652YQ8WlNLTaNFRR3BFIV+qUJf9Dd7aS1HelgsxUs=;
 b=CVLF99W+N2AlUCQxIK5RsCymZEW2MWKFZAW9I24yA1scfd6a3C7QCZZQqHCAz5cDrA
 OVnNu4XeDEWvk6vBQZZptfGWIWRUSuCGUR0aK8fne6SckkepUWh527nEEc8TYYY15+jk
 HUOwpHy2plSwncSl8cMHDgO48FkoAORuYXNJkeqKaaZpMRuEqawbHV6yaBzKzhFh1ptl
 vtXYMl7y1XBQHQO/FB2IR6SO72kc4EvXiLX7YtnopgOe2DCNAYoqNQlDpy+6htN6LGY6
 PnlvGth5nLYAU/kkGU2xbRce9zXGk7VcqaXLdZ/tlb/tczfv0fMOZe9cG2cax7RoyQQn
 cMag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788141441; x=1788746241; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EHWkIpJjbvCM8i9EVzGkfSqsE5M0tKBuD6Cyeoh+D9k=;
 b=VA6vrHTo0E6Aq2xSYI9ZWN3i6pD0uDiud1GTQB8KTWYa0Ka3YDsFNBLwOo+Dex8MFk
 mMVeNTol3NKG30s/MnE6zwqvmuKaxiWqWdL+eLoQAmQmIPBlQXMkk8/m0OxxxmbeQKLU
 QLNqV/QVg6U79gMFR5yF+HiL4h36SgQNBSxT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788141441; x=1788746241;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EHWkIpJjbvCM8i9EVzGkfSqsE5M0tKBuD6Cyeoh+D9k=;
 b=Rl1zx8tYSNmIONnBI/jXn/Ro+2kiYzrI/u9iBw39byczJGhI1Wnie+LTQacti4cCFV
 DvHBv7lWpDUZzVwvi5SDQg41hu4mZSe3pyYq2GhqE077KRRFqzvhMXzT4PRMqzzqE3Z6
 MJyDmgZN591Zr3ymaF20kmi5bqmTq8D/jkt1v44QucG8MtYRON+UwO5oZ7r+eN7NUEz6
 1cp9UD760+auAGgBlWRF4vN7/x/EryozvJSBPoXq5N6MiS/wJgjlTRqSpZ4IfEVuIxUn
 IXWM2NkQjWDX5IK626k3Y8uhLB2JgYu6x3LvBUYHPF/677dHnGMWsZAJHAqlFsxRcMZG
 y7fQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4ZcOkQeOVukVz6u0Xicnmc7wHFO75/1AgxlEkuUdxGHU2I4msRULgi/8KgBzlenquJ0CT9lJi3WZW@nongnu.org
X-Gm-Message-State: AFuF++neCoVqlq43KE70yX4Rtz0jjpGDP8Sk0etAEzEH23I0GyrXPxix
 vcyjUseokdtGdC71uHXqIzK6WhORC6YyMl9l4+QNB8b8TBpCLfWQkkcuhWLxVGS09+L4Aa2lkrc
 eF5FdbZa7YxUTjFRnC3jHbSU7m5RiDGs=
X-Gm-Gg: AYBFou3TJYCzi6UDXhOZssbFbziZwUwbwrZN2UUCmbJk1+b8+pihmP/BDZ/EqadhhpO
 taB+vcM3eSEjnqyKG/TmbB3x+yC+CN3z0Vn3L8oepLrO7xQZ/C2k7fFdHtb6CB4ANcYMixfQkvQ
 c34LTM1ZyobdCLwLPbv7v627uaXFRClhHyGWohNgQZHAjr4g7D/rgxrJsLnmb8B5SLC3I87HI1f
 s9CaLO68SfHSjX0DCtOQADYgjLb2auUpK4sy3UhXjOT4se22hzul1ojchgvtqP5t2fwXt67wdcE
 u701vmTLFELza9LidU/ht3Y8tJxbyZCu5NdF7JdLgRX2CoHOj3bbyvcIdojMP07X4Kqtb9OpZ+b
 vjUF3t+zVdhgvu8FRcY1aOvyo31g795Hr0vdAzlKepW9xwwiQjxkGr9WINaC8kBJ0O+LqY++gsA
 mKAe+nakhT3LWmJUj5
X-Received: by 2002:a05:690e:dcc:b0:66f:7717:a6f0 with SMTP id
 956f58d0204a3-66f7717ad33mr1396300d50.9.1788141441358; Sun, 30 Aug 2026
 18:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
 <20260826221154.54577-6-joel@jms.id.au>
 <be675569-27ef-46cf-82bf-563852bbe66e@oss.qualcomm.com>
In-Reply-To: <be675569-27ef-46cf-82bf-563852bbe66e@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2026 11:27:10 +0930
X-Gm-Features: AcwNN1X53eB0-VFKX1pK9bXW42LA3jchxcdYCgFmZq25_dYfGj50ql1BNvrUmys
Message-ID: <CACPK8XczvftDPUVb=2pX9ofRNA31jhLopeFPse-o6s7h27BVuQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] hw/riscv: Add property to hart to allow private
 memory
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12c.google.com
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

On Thu, 27 Aug 2026 at 21:48, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> On 8/26/2026 7:11 PM, Joel Stanley wrote:
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > There are platforms where CPUs have different mapping of system memory.
> > The global system memory does not allow for this. This adds an optional
> > property to assign a specific memory region to a hart. This allows for a
> > machine to alias the hart's memory to system memory while the hart only
> > views memory from its own memory region.
>
> LGTM but please clarify in the commit msg that the memory region is being
> assigned to the hart array, not "to a hart".

From the machine side you're right, but I agree with the commit
message that the memory region assigned to the hart. The property is
being set on the individual hart, not on the array:

    /* Use private memory instead of system_memory if provided */
    if (s->memory) {
        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
                                 OBJECT(s->memory), &error_abort);
    }

How about:

"This adds an optional property on the hart array to assign a specific
memory region. The array passes the region to each hart it creates,
so a machine can alias the harts' memory to system memory, while
the harts view memory from their own memory region."


>
> E.g.:
>
> "(...) This adds an optional property to assign a specific memory region to the
>   hart array. This allows for a machine to alias the array's memory to
>   system memory while the array only views memory from its own memory region."
>
>
> With the commit msg change:
>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

