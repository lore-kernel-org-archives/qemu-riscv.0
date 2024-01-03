Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95C1C47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:50:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5No-0004PO-5P; Wed, 03 Jan 2024 12:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL5Nj-00048H-9u
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:50:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL5Nh-0001Cm-5O
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:50:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3368ac0f74dso8912914f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704304214; x=1704909014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5F2VXYkjrYII2wHzAQk4L5HsWOBoBNWS2pQ57+FVJgY=;
 b=H+1UoxeIGkHIrBXJZmkZKWZK5WiP7z/u32TFffC3P3L1LkEmdTOkAZaibRSO9W5XdD
 Goz5jJshltgYqo9qEQkez1O1YYuEquHErPSc/6m7B6EkW1r++qlpdip1CDtcKWHL+akv
 b0Hp9qfzCFip6d4TF6e3VA2YoUicMsM/MchBm0V5w2+0/dZecJWJzCFoxKyGe1vqlKdF
 hQjMIirwU9+DbiOyVVQsQhFVYX6bzVFu3AuukM0iMmisMXRI3pXLCNRl2Hru1MR4z/Ui
 pcPODJfEhZzZHRInKBdqc/Wc68AdiJrJe7Wuojb5E/r2Kb84crjqxieAy8LsQFUXng3i
 isHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704304214; x=1704909014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5F2VXYkjrYII2wHzAQk4L5HsWOBoBNWS2pQ57+FVJgY=;
 b=pL/Z9vqH52HZ5R0ILinogBP1Xx7ParipU+Xu4mBkAaqwN4PTG9rHdk/2gMoikKNG1W
 iFAU9LRpHJtwIBQ47SSMo6EmW9QQDFkz9/6HzWWOu7OXGJHXuMc7NQLkekHjFg1vAA1E
 1u8o5EKF7ikmW/1mpDzfxLrGzfF6Ypgylo5Ldh7Bg4vVCWtKS/HcvBo6EkqEFpO8Yymx
 i+KKXh3VJdV0DeC1oI/J+tgZXDxZEH2cmyzA5KnQ/5rAEx1gNUN4J5RR58ALZRaikqik
 NdMXw1zXdL0M/xA4WADPTSuz4kyQXwjT9PuxWmeFqjeanPRk5MqivOcSfni+OzRAFbBt
 w9Sw==
X-Gm-Message-State: AOJu0Yxp1t2PQDdlgnONpwJX/jmbsDR4cpiYI5sjJTBVD3BHqpciH/bs
 azLGS4O4kb5sEyl8OWSh3lmAlDw5lFER3Q==
X-Google-Smtp-Source: AGHT+IHOec9oNkIrnlY9NK6/rK0VGc1b4NubPs5VB1Dj8nGfMZLG0FwRX19cqc26uA170W2Jd13kLQ==
X-Received: by 2002:a5d:6910:0:b0:336:6dd7:4a13 with SMTP id
 t16-20020a5d6910000000b003366dd74a13mr10911726wru.121.1704304214537; 
 Wed, 03 Jan 2024 09:50:14 -0800 (PST)
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr.
 [176.184.7.144]) by smtp.gmail.com with ESMTPSA id
 c9-20020a056000104900b003368849129dsm30420818wrx.15.2024.01.03.09.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 09:50:14 -0800 (PST)
Message-ID: <1a923274-8a4a-4811-a836-9a0866e2c852@linaro.org>
Date: Wed, 3 Jan 2024 18:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/43] gdbstub: Use GDBFeature for GDBRegisterState
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-31-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 3/1/24 18:33, Alex Bennée wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Simplify GDBRegisterState by replacing num_regs and xml members with
> one member that points to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231213-gdb-v17-5-777047380591@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

