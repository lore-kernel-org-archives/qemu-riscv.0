Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFFCC001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:46:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQTDl-0000oe-T7; Mon, 31 Jul 2023 09:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTDh-0000i8-8v
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:45:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTDe-0001rF-T7
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:45:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-317715ec496so4837546f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690811153; x=1691415953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nQ3reraINQ9aqfKUKaeldl1vlh1lyTB9JIH6X3eokKs=;
 b=h9lwSGncjCHcAn12JKsftrabS4nfigm3sHN+MhY6qrIozYkfycqMaJwYAVGMULRLRl
 hCIAFrlDlr5qOK4DzdtoxX0IeATQbS+bc7oRO3QQlbIQ3t+A010rT78zpKnbN1GqMa31
 MTHUga9IVCtMFnLJBPb0UBswnRupNB6r8jzRRur33UAiwjLgczomFkN2LArkuSW2zie1
 +VWN47jxXanCA0sq3gFMCibAmT8KqIJ6jxQT3dSmBE3a3FFc8zVhUORcIykbbs5tz9YQ
 1VIlmgsjKh19oF8n7CP97ygzELRD5uY8v+I88WDDD9/1qnUdOM1f0lg1YWGbz62BF7fE
 XwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690811153; x=1691415953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQ3reraINQ9aqfKUKaeldl1vlh1lyTB9JIH6X3eokKs=;
 b=HmiflMlXhcNSPwk0aLB7z+35GhgwVMCJjbiWbKTw+w2nDP8W5x0jTR6wGTMZ32hxHi
 N4aIameN45jhfleEgv6OMweBriADd9W9bEuXoL4AAHkMcZFSl/X0stdbL25rAw0hsPpe
 hIT6AXZJLtUYSVg37B04jIGdWgTR2PPfKLb+0CSBFG0YdN8/hsrBw1ZbtbxyPgfCMISA
 81rqIl4LMEBmT9f8BKGTAhq9AJCTQ8VwiVb1Osw6B++ode+/6Z31UGnG0KSmndJGiQT4
 crVIoxEXG7VhEI7NgzwBnfdvPfAgsO8QWHoGY6EZtLON5WhQQYatvNFRXI9/RX2MHbck
 BYBg==
X-Gm-Message-State: ABy/qLbBS5FIWTbVLMgL4eOaplPUGTXGX5+dtieJkMYrROWkycoBTN4V
 FhrB7YiZBdJaEnlKiehPDXqcfg==
X-Google-Smtp-Source: APBJJlH4gyq7JrTkfEpvQa84k4NIFE18KTu4UsifBNdTs57wOfERvKO5Hcmx4G0JBwtVPCjxuezb3A==
X-Received: by 2002:a5d:4acf:0:b0:316:e04a:29e8 with SMTP id
 y15-20020a5d4acf000000b00316e04a29e8mr7512961wrs.54.1690811152959; 
 Mon, 31 Jul 2023 06:45:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adff152000000b0031784ac0babsm12011439wro.28.2023.07.31.06.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:45:52 -0700 (PDT)
Message-ID: <6b4c6870-35a3-0f7f-b405-ca6e6634c4ab@linaro.org>
Date: Mon, 31 Jul 2023 15:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 08/24] target/ppc: Use GDBFeature for dynamic XML
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
 <20230731084354.115015-9-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-9-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/ppc/cpu-qom.h  |  3 +--
>   target/ppc/cpu.h      |  2 +-
>   target/ppc/cpu_init.c |  2 +-
>   target/ppc/gdbstub.c  | 13 +++++++------
>   4 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


