Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB00C5478C
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:44:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYdM-0003ms-SR; Fri, 23 Feb 2024 11:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYLX-0004oe-Hn
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:24:23 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYLU-0006RL-Ly
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:24:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412949fd224so3529705e9.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705459; x=1709310259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDPoOTgJFDyrZUjFq6GO84tsxgKNaYK3146PG7chcsI=;
 b=Gj37GkUQcP6zSxIy+CjCifCbiSqLR5OL4gacQEIEEHKDnrS8yIEsRflxfY1SyA4P0c
 nbhDEmORnF2pWFrFIQMfgdO/KM86RCQMrKaJzT5Bg2poSEJ3jrO3kcepoQm/ISNZc4lo
 u1zLJw2RsQFCwMlIIe3G8kU2G5TU5wHaY0OLL+VHNhRnq3KelEIafuUzasf/bFIXBHdK
 BsMmaJqhh2Dcol6Zzjy5zoL204cJbp5zXAQ93x2nbiYnpo2JKGAaYdCz+pl+7iOE5hrd
 vd1oY3+FQvXOSpz0ZXZ9MdoiW/EvjUF+Z7jp5cKH3hrMev++fIvr3g9U5kc6p+OHCR8E
 XL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705459; x=1709310259;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QDPoOTgJFDyrZUjFq6GO84tsxgKNaYK3146PG7chcsI=;
 b=sgA3AC+8NcNqpXJHv7TZ6GPtcfmyg7DggrO2sF3lK0TQ4osDSHfxddlFqrH9YjURqD
 ojzd/ANlRewSJXH486O+kt/4k5xEBicqvqu8xQ1KNQ8xSAkpZqwwqYETaVw0sB+Y0U0S
 9OUknvTyK1rTv+D7DOsNDdNRY9sT0HUuzQBojUl7EDzlGQk5BiPvksaP4K2JzVoee4N5
 Tjtmbs1KMmXdOxSdudx5UGR0hlY4kZal40goYlXpPvPbHqFHfJJvONBkPXIu+r+3beKw
 zZnIum8znno8N8xhZNfyr80CSlMCkYTL2zVXbzWeJOlyF9DjzJlinhLPNz6NajplRLPH
 ckeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNTVfPIaxIHpenEt13tP3fksif7n/CbBLU1mkAVjHxKkkhVKK/q+OMHM5za7RJQgqPU2rTF3qY/qsnKQBXA+uawDf+Cs4=
X-Gm-Message-State: AOJu0YwsxvOj4JrTcYRIXakLu7tWDWYvFmLBPi3Ib7UAzAwuwbp9oxq+
 rDV143U1V1esOEdWwSKxm+H9ScaDXj0JV8n6eUHUZDfWEk8qerVKIeDr6OsSbbQ=
X-Google-Smtp-Source: AGHT+IHVOSb6IIVrzAwdQtzoDJL6yukrRYIWP9JeoowWDn2K3rCxPxP9veXekKt8dcJyOeXfsGB2CA==
X-Received: by 2002:a05:600c:35ca:b0:411:c8a7:7b09 with SMTP id
 r10-20020a05600c35ca00b00411c8a77b09mr284914wmq.10.1708705459248; 
 Fri, 23 Feb 2024 08:24:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ba16-20020a0560001c1000b0033b2799815csm3561519wrb.86.2024.02.23.08.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:24:18 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 80FBD5F781;
 Fri, 23 Feb 2024 16:24:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Michael Rolnik
 <mrolnik@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-riscv@nongnu.org,  Cleber Rosa
 <crosa@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Song Gao
 <gaosong@loongson.cn>,  qemu-arm@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  John Snow <jsnow@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Nicholas Piggin <npiggin@gmail.com>,
 qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Yanan Wang <wangyanan55@huawei.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Brian Cain <bcain@quicinc.com>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 Bin Meng <bin.meng@windriver.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Alistair Francis
 <alistair.francis@wdc.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 18/23] plugins: add an API to read registers
In-Reply-To: <87jzmv8kwx.fsf@draig.linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9?=
 =?utf-8?Q?e=22's?= message of "Fri, 23 Feb 2024 11:44:30 +0000")
References: <20240216163025.424857-1-alex.bennee@linaro.org>
 <20240216163025.424857-19-alex.bennee@linaro.org>
 <c38a22b5-01e8-40f1-bfc4-4bba9bf7b516@daynix.com>
 <87il2jcje8.fsf@draig.linaro.org>
 <bf31a250-9539-448c-9c64-4168ab8741f1@daynix.com>
 <87bk8ab0f4.fsf@draig.linaro.org>
 <bf5e9471-c09f-47f2-a5a3-83713255c47a@daynix.com>
 <87zfvtaoqq.fsf@draig.linaro.org>
 <7e4b4ba6-3683-464f-ac37-3b7f19455643@daynix.com>
 <87cysoajhl.fsf@draig.linaro.org>
 <f4b0b535-9e2b-47c7-a84b-afd851deb88a@daynix.com>
 <87plwo8l56.fsf@draig.linaro.org>
 <308de8f7-5871-4d3d-847c-f4f55fb6f790@daynix.com>
 <87jzmv8kwx.fsf@draig.linaro.org>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Fri, 23 Feb 2024 16:24:18 +0000
Message-ID: <878r3b87yl.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
<snip>
>>> What about if I just key based of gdb_regnum and we accept that that
>>> might break the one heterogeneous system we model today?
>>>=20
>>
>> That's the best option in my opinion. gdbstub won't work well with
>> such a system anyway, and fixing it will need something similar to
>> GHashTable. But if I would fix gdbstub for a heterogeneous system, I
>> would add a field to CPUClass instead of having a GHashTable keyed
>> with tuples of CPUClass pointers and register numbers. It should be
>> fine considering that CPUState already has gdbstub-specific fields
>> like gdb_regs.
>
> It would be nice to move all register code into CPUClass to avoid
> repeating ourselves but I suspect that is quite an invasive change for a
> later series. Currently all the CPUClass values are set on init and
> shouldn't really be changed after that otherwise we'll have to start
> messing with locking.

Peter pointed out we can see different register sets for the same
CPUClass but with different features enabled which kills that idea. I've
just sent v2 which re-factors the plugin data a little and stores a per
CPUPluginState hash table.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

