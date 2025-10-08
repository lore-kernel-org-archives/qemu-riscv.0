Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1BECCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 14:05:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6UnT-000675-30; Wed, 08 Oct 2025 10:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UnR-00065z-FL
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 10:05:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UnH-0002lB-3N
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 10:05:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso2306402a12.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759932319; x=1760537119; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P89cxlA77MATEenNkyZK5x3G6H8a1M3bZi4QmpYyUI8=;
 b=FU1qmlxYcxHiiq+T8SnDYknWs/8px74+N1Ijfk7cINfcm++VaQ2T8ROW42zT+N0xQ1
 XE0Wb8d7VvHcRLLTIeWDGWTSrgHwEAXJnEPVvc7nTv0+g13kpe8zjY7ROxYCnYh2SC9f
 zlr9bk4Fu9H1WdF7fmqPYordDIeYVja1srRTAyIDlKBA1Yw2vU2j0DpGgFGlDWvZ251C
 aVlNTMme0YB1cjdIbDTf9+7rtAj9QUIDUxgvfv3lQAHPiH3ShyGBdAX5p+HHhdTuBnoV
 ddWAmMU7YhYG0qPMcYXIZBmzJv8fe2Evi/x+0R3Xq9WE3p2uVYgWJ9OKZo5FfzUR+0/i
 5kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759932319; x=1760537119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P89cxlA77MATEenNkyZK5x3G6H8a1M3bZi4QmpYyUI8=;
 b=ldPY8WKjk9T4N+G4WmQE02VlJ3pUP9Ucu1Hiz5BSDg3fm89DTb6KeX332An9bciXSJ
 UVpZV2GthK3uUCzb6fkmnfoPa0YVwHaUdroAVqDED20ynyDJXFeqTUxjhfgGK53LqK0l
 LZ2On/TWWOe3JlO2OyikaA2Yy/i8oiRkUpEB9NKAwRf66O2S1LqKA1gD16NHCApC4rR9
 t1q4wCK1O2L+1obWSX3nYs/vg0g4W/h2Hhzms90nqY8lN3IyZhKTlk16RNdmKD2DFwT3
 EmdlqryN6s9z/FF8Ch0JJz/cPvDlO4ELHx2C1NTfgcP/nhwCSl1n07IVeor2lq2yv+A1
 T4Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5xIcp3OsTO5aJsjeCUHzHhwy4kjQATgcOEHy1Mi4UCAEfYkkPoK3AbmlbbmfDEQKwbf5USdl1DFMn@nongnu.org
X-Gm-Message-State: AOJu0YwdifW9rur9FFTZcqqVZAFqj7PQPxjRvhYjgG4Y74J7h++QnC/A
 vJzibbjQVyS96CF4be2cPwRdC4554uncw71942n5kfdCb4d+FFWvZCqBEWJ1K1RT7peLSXKNz6B
 SmQ+tTQ7arMYjmWVr85TkzdbMc/pUc0AAn8dDF/ceYA==
X-Gm-Gg: ASbGncuQ6ZoM1TNx/kP+Pt6hd9EK8XGxaa+IvbAk0ceQIeItLrM9j5oqbM4ucKmT+ND
 9JTCZuUsboztNgFjI1aG/CJAynX6wYyeLa34LjYv1kw2q6EZ4NvSAlvahNwownKd6HbR0ApgNI7
 YIf/KrIU3K7Et/yBqeXMMDbbgvc72EO8ozBq7oiGxJKs7Y3AS9YyoHk3vzPSJluXIN69VpnR/j+
 lHC7p9xZcnnyY1SEHC5CSCH3P+duCEOM2ec48y/3Jk=
X-Google-Smtp-Source: AGHT+IH0MXTsk0fH6+bAbSMBxQemeTj05+vAQ+WHjQ/s0L2VhsLkelz+1BKEkWLCKTDFNrxDZT4M4BviCbPNHBqF60Y=
X-Received: by 2002:a05:6402:1a4d:b0:639:db35:62df with SMTP id
 4fb4d7f45d1cf-639db35684emr2199481a12.3.1759932319199; Wed, 08 Oct 2025
 07:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251002145742.75624-1-philmd@linaro.org>
 <20251002145742.75624-2-philmd@linaro.org>
In-Reply-To: <20251002145742.75624-2-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 8 Oct 2025 17:04:53 +0300
X-Gm-Features: AS18NWA_LsS05ve41Qv5r7SlMFJLS5-r5qHjMvyQyMIaZwBAeBuUvtmRInf_-Bg
Message-ID: <CAAjaMXa70ZosRzVz0OMQDhYCWOM45wbbsUmwRCuCfMejivJ3DA@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/i386/monitor: Propagate CPU address space to
 'info mem' handlers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Oct 2, 2025 at 6:01=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> We want to replace the cpu_physical_memory_read() calls by
> address_space_read() equivalents. Since the latter requires
> an address space, and these commands are run in the context
> of a vCPU, propagate its first address space. Next commit
> will do the replacements.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

