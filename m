Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D41C3DA6D
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 16:03:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHPPq-0007Fj-7U; Tue, 20 May 2025 12:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHPPk-00075b-NE
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 12:02:02 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHPPi-0005FC-BZ
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 12:02:00 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-72c14138668so1855525a34.2
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747756916; x=1748361716; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4J/1nmcsTkQZLl4Fse9tCfOco8yvWo1gChIlHoTB7eY=;
 b=RIK4BgFStcbG8WNxti6KBnMYSdkVbhjLUkflM8q/gjrCdytTY0f8StPVGh4gH8w+bE
 YScWc+ZRwPTCcSzVKLDUtDarFBnhgaGFz60J4Fg/NDipEtNngXATBTRGSFs9dy8NPuce
 Arfxv4HPpWH86QnmmS73BqxD7MraRt1Qff2oVGUSy6GlQ53mV0+OKz1LdUbjsDSqfD4K
 oN/oVUTspgJ5ARJut8pWZL+4bUaMEb1kslZG9UU1B6dAOx6kxGzLLnTrqanFZ/Vs1HPX
 dT+Gsi92IwtsyrtS8WhIST9wj+wuLMd9pqKNMpdM5ZtiQlDnzfe9SojFlzZE6t8EjQW7
 k9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747756916; x=1748361716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4J/1nmcsTkQZLl4Fse9tCfOco8yvWo1gChIlHoTB7eY=;
 b=RytQLzl3ZxDn/rjHqCms1I70tHvpEXAMLeuCDb6Xl2iLDB+bJ7oIXpIvsVSNyz24FY
 IbzQfNSQaPhy9DC/ACz3AzdcNnmIkk1hfiVUT9M09A49zAbF9V04pEFuKA1gsEmAVPTY
 +9/ooiZtwvaV1K7fgxLHA3Yd43/oI02RiiTiKKOEg8q4QTLASGNu9oYAuMkgKkWmJFys
 J/KpnY9WHJi0wLJ3bzFIUfbb3LfSyKGzejckVz7DpWqfRDtzCD3m06L9xXBoJMZCwA5D
 QPxohud2pWwRG5ojZf5zXzbr9zACgurNJ4t28WqtsNR8nCGPxvh6QMnYAqdWLAfyVpIU
 0w5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO65r7+/eRBQpgizRirSKM6C37C0CPMTf8/mNeGu5vEqZG7JGEn3XEMvj5gJ3W0PQ5SqVc0+Gf3s1T@nongnu.org
X-Gm-Message-State: AOJu0YzjS+BrPHP/76jeskEDQD0DQNZbHDL6RPv4nr6GETRUwo8Ml+Sc
 n3f+wiNzr8dMCRZ7mpJZLAro8so/EU92XQ/wWZyby0P4O8m/kIpwexfjX6w1xKy8eD+4mioiQAO
 Vjgcb1oDn/d+dtMO1sPmCli2ldaf+xr8E2mYroCZvtQ==
X-Gm-Gg: ASbGncuuOugD5he/21x+lFfB03+Ku7CDkH0RoiCRtqUn8m8jKvaXRC1rOVwCG4cnwxi
 HKO3fbZzC9BHfjSpNrAOMOhBuzRHJhuEtWvGyejjWO08cc8rko0UPjOcfRlhY/6qok+Y3mPADE1
 UAF5KVPt5EbvSA2ATv4KUZ+1n0/yKQugVjsg==
X-Google-Smtp-Source: AGHT+IH76L/wU5IO2UxG4J8Z3ZMqfugLgiQ1+xjfbJJbUuI0+zEdylTKVCWnQbCGhpAcPcbn3yHUr601FI1j6mpquxw=
X-Received: by 2002:a05:6830:6118:b0:72b:9d5e:941c with SMTP id
 46e09a7af769-734f98a0a92mr11157637a34.13.1747756915995; Tue, 20 May 2025
 09:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org>
 <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <87cyc39t52.fsf@draig.linaro.org>
In-Reply-To: <87cyc39t52.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 May 2025 17:01:44 +0100
X-Gm-Features: AX0GCFsmq3DmpXmc5WxARfUl5H4vQhLAms1sFBx5gScfP9uplVGUjODW33FUfik
Message-ID: <CAFEAcA-FgXuwesHjWWvvSofCaFTK9yOHHuRBF+15f2NhpXjqYQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before
 binding
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, 
 Nicholas Piggin <npiggin@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, 
 Kyle Evans <kevans@freebsd.org>, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
 Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 20 May 2025 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Michael Tokarev <mjt@tls.msk.ru> writes:
>
> > 07.02.2025 18:31, Alex Benn=C3=A9e wrote:
> >> From: Ilya Leoshkevich <iii@linux.ibm.com>
> >> In case an emulated process execve()s another emulated process,
> >> bind()
> >> will fail, because the socket already exists. So try deleting it. Use
> >> the existing unix_listen() function which does this. Link qemu-user
> >> with qemu-sockets.c and add the monitor_get_fd() stub.
> >> Note that it is not possible to handle this in do_execv(): deleting
> >> gdbserver_user_state.socket_path before safe_execve() is not correct,
> >> because the latter may fail, and afterwards we may lose control.
> >
> > Please note: this is linux-user stuff, which is usually linked statical=
ly.
> > By linking it with qemu-sockets, we basically broke static linking, bec=
ause
> > qemu-sockets uses getaddrinfo() &Co.  The previous code, I think, was t=
here
> > for a reason, - to avoid this linkage.
>
> Oops, how come we didn't notice? We do have a bunch of --static targets
> in the CI.

We ignore these warnings because upstream glib means we
always have a bunch of false positives when we link a static
qemu-user executable. So this one (which is in our own code,
not in glib) slipped through.

I think it's in the same "annoying noise" category as the
glib ones, because the unix_listen() function won't actually
end up in a call to getaddrinfo(). But since this one's in our
own code we ought to fix it, either by splitting the source
file or by reverting the commit.

thanks
-- PMM

