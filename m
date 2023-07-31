Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5076C001DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQT4K-00010m-IG; Mon, 31 Jul 2023 09:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQT4G-0000zc-Ob
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:36:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQT4E-00077o-CE
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:36:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso31219365e9.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690810567; x=1691415367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0z9m68fumFWDSuz2IWQxIZ0SeaHB4wPDPgx2tio7qw=;
 b=OxX6931QTMcRV2b/y8dp4xkgJMbhPi/O4rOe3kq8HpIoUo4hg2NUi5vC+qcL8w77yQ
 BA7fIeaI39JPzCxMCcoXzi1P0niV51Y08U7Ot+BerqEjfXyFbpAUjL/SgbO54YvZMiw8
 SYZKwq3NArV3ildsW+rN3Bg1poWp2CRC0n4nm65zblZHA0fupvjky/5CVsN4BP5wbjUN
 ZE7P42a535XXrT+LPbQEunlnfGMcD59y6EtS4wjZ4iKQWVTpYoDzupukYKN3r0WYA0YV
 +w8TYcBpiYnpHACMaOe47+ydTvTDOjgLYiimisll9oFuAvRC7eRLJqhfS7AgXVMU+658
 s+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690810567; x=1691415367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0z9m68fumFWDSuz2IWQxIZ0SeaHB4wPDPgx2tio7qw=;
 b=LSm5heilqbD7+hRj1FgtbAjLAvxQxNnrzc8lbY9uL/DLjqytJI+ZQqZ7sYe5ERuCPQ
 ylIlJ0cniZXox5XqI65kpvvKlvQfne/te3QuxIDNKE0U8lJNPgrTNejx9YLCIIga47m2
 bGVVwsUBcGJdDC+1hysZ9ZvH41uvu/vCCa+w98pQ5JVgGhdAAr+J4IPxwM8sI3g+PFiR
 CXIJYVvU5c3tNK0jZw+Cfos1cGsSVFHEAI34Oe2hFUa9DLEeRLGDBM6Hf4He3SmBZHHy
 LJS+ZEYjQk/iVIZmMGh5LuOvMmxVn3lyq7WaHcOwsoxjR3z3J3ZwcN2zU+mijuEQEnNe
 b4hQ==
X-Gm-Message-State: ABy/qLa2lh88D3cBcbm5ZQAHllEAti/Q6SUjB35ap4B2ftC7oB3sgj2S
 iYu0hn7SFR9tfB9v+1/b+uprvQ==
X-Google-Smtp-Source: APBJJlHphjBoN5iWkPwJPtmrbwnGtoqD5CFqMasC8/idVq/LLgnv1DQcqZHVBhdhnI7YCujdIYZzlQ==
X-Received: by 2002:a05:600c:29a:b0:3fe:1c10:8d04 with SMTP id
 26-20020a05600c029a00b003fe1c108d04mr3749092wmk.19.1690810567628; 
 Mon, 31 Jul 2023 06:36:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003fe1ddd6ac0sm4122960wmc.35.2023.07.31.06.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:36:06 -0700 (PDT)
Message-ID: <b41b076e-e423-7399-c03d-1f002edd6324@linaro.org>
Date: Mon, 31 Jul 2023 15:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 03/24] gdbstub: Add num_regs member to GDBFeature
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-4-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-4-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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

On 31/7/23 10:43, Akihiko Odaki wrote:
> Currently the number of registers exposed to GDB is written as magic
> numbers in code. Derive the number of registers GDB actually see from
> XML files to replace the magic numbers in code later.

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/exec/gdbstub.h  |  1 +
>   scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 45 insertions(+), 2 deletions(-)


