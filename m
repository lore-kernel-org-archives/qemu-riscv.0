Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FCEC27C40
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 12:40:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZ9dM-0003za-Ck; Thu, 24 Aug 2023 08:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qZ9dL-0003zJ-Ru
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 08:40:19 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qZ9dJ-0002f5-8b
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 08:40:19 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68bed28cb22so638278b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692880815; x=1693485615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AlD0KkcoSMnm2QId2bF2QJsTp5aZ7edM05dvtgmHarY=;
 b=2GE06rscmgwtSEOK3aKHSpS4LRMu8rmUk/KZrP+bdvhnsQ5jwv+yCCBw+vTaIpyvJs
 eSAhPdT0etRUNmbGIwTrVaud5pnke26oC2rKhgP5XMuShYlROu6i5CWeJu9cKRMsh+HF
 LVDLTW5gvwTrqAhH3jSWbxgUefmepNpbAWqA5VL71QSPdG1brHBYiwg40/cAzEm6Bc+g
 /LU4VTojJSTe9lHX6MSuB7bMG9DTOZA/p7G1WiIdCL3k7SH9O3dokqlQ/F8bL8Gr3tIi
 5jQI2PRDCpp2AyPaa9j3yh8mkwolEneLgQmXses061xbGAhHYpw6v/bfBLiTK5ChEbdk
 orNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692880815; x=1693485615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlD0KkcoSMnm2QId2bF2QJsTp5aZ7edM05dvtgmHarY=;
 b=eXjkn5ubogweOPhAK1xPXmN6yNBXXsO8zo/Drm5kP+YVndU8YXQi1RM9MVQGsJoobb
 dIQALZuNm5fG/J1lOuGexJH188kRNUbX7+8vfy9eEVPrVG6bO+nJSpqDMaXGh/0CgP+E
 LgKipa1vJ/Z+9zUKqfdgBb/zRDBgnx8RMYUw2osc130ROlutnA4KpP+4HzUR69BJJPOX
 muS9DRtZMd3BHcYSsj2OCrMu1wy0p7g1Q7wbDLXZOerbHeiepuaP3mu+wjtlDQzLyIBy
 Zz9CtjuxFNb5ZTk17lAKj7rGNmpDyhyXAjI1DEN5AnEI/st2r6Sh4wlDDTgzPf7VrSM1
 ztsw==
X-Gm-Message-State: AOJu0YymHKtbPfj4GL+8JNYcNNohGlr6f9gkf30SAIhYQalpByIXDwGn
 TY9s7X8btSh8I5zXTjyZT8nFUw==
X-Google-Smtp-Source: AGHT+IFjJ+DGBC6A5fjKq/d6Bq4vcJn2uJykLIl0SwHmvdO0JIAHD+Ws+6BTM2E5J1IvXoy2/jTbWQ==
X-Received: by 2002:a17:90a:dc05:b0:268:a691:412f with SMTP id
 i5-20020a17090adc0500b00268a691412fmr11837891pjv.39.1692880815202; 
 Thu, 24 Aug 2023 05:40:15 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090a16d700b002680ef05c40sm1609373pje.55.2023.08.24.05.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 05:40:14 -0700 (PDT)
Message-ID: <0a1b665c-31dd-4263-9f67-a75c8aa3fd7d@daynix.com>
Date: Thu, 24 Aug 2023 21:40:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/26] plugins: Allow to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
 <87wmxkfwfo.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87wmxkfwfo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/08/24 21:36, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> I and other people in the University of Tokyo, where I research processor
>> design, found TCG plugins are very useful for processor design
>> exploration.
> 
> This series didn't seem to complete getting to the mailing list. Can you
> re-post or send the next iteration?
> 

I have resent this series and you can find it at:
https://lore.kernel.org/qemu-devel/20230818033648.8326-1-akihiko.odaki@daynix.com/

