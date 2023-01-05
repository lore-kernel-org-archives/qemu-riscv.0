Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTdn-0003Wc-J3
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTdk-0003SO-C4
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:02:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTdh-0000Dk-Tn
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:02:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id bk16so23541271wrb.11
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CcnP7aWAb4dGVBRr3hshFgzv0C2uofau7hSDirUapjg=;
 b=lBK001LK+TB3QKxC789UxkS6/4HDozC0X2AhfpnwbaZEXshUT1C0PtryZ/xLCWMx1+
 9E3bEAIdjGIaPEsSjR6rRbofvUK6pRQJEa7j6fdyghLAtREAsZByDkG6xjFA3k0uvnO7
 4WFaFMyyfZu8fGfY1910r0jlkyUPYFDiRrkWeUkrYmaNwWExXN26uPmRV1eWvLPlV+fa
 2cGLpxHe1b4qQxbwyTSVBvmr/AEx9/45IoJUWbmtVX/nu9bWcsSVW/oLoPVXb0vbVoXN
 amboexTvz6ZKwHgjzORXcXOK14INnbj07MoxqLPov+w1zA/VApWwsWRTbd7cq4xDfUpE
 WrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcnP7aWAb4dGVBRr3hshFgzv0C2uofau7hSDirUapjg=;
 b=H8hMcSUZwU54eNVnSpfV0H3qzQKdZti4w/41dN2MM+NcMpSeSOA3gIT14cLVQQ/mD8
 Rsmw9G2LClVTryNU7m21WRY6IgcpfbDMRHInyLl/UyBJO5U2YeZrewtyNx0xTfpffhtq
 N1LlLzQQhxPldLLT5V76zOH3yvCr3w2D/aC8EWxFR+2SGb+0uvo6N+Aak5MUSyoLCFEy
 6dXr0vShCXBW7Rk0o7+3HqPaNP/wMA95wxJ9/ikKm+BaD6zNQr69GG0r8F0M00nRRG2Y
 e+d2p9UeFAQup0c/s0rrjHjY2x0R3MpLsVRxWjxHpnBLN1IJv+ZzP9qyvsh14H+tSBo1
 rxZw==
X-Gm-Message-State: AFqh2kqPlckZlCHl2W/nhZTH47gjzsySvL/U2/w1Lk1+9/bqzQa/VQrN
 +cQGHHCj3TQq/dmii9sLUEJUyQ==
X-Google-Smtp-Source: AMrXdXuAEUHl/LgDd+1VidXYOm2Iq9N6Bi6jGDBjuqtVLdihba82r0wdEHnfaUaM12OL2tc1JHxy8g==
X-Received: by 2002:a5d:640c:0:b0:2a3:1c13:2888 with SMTP id
 z12-20020a5d640c000000b002a31c132888mr5691577wru.60.1672938167717; 
 Thu, 05 Jan 2023 09:02:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bt18-20020a056000081200b002368f6b56desm5593135wrb.18.2023.01.05.09.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:02:47 -0800 (PST)
Message-ID: <e37489ac-78c2-4930-9cff-9a172a5925c4@linaro.org>
Date: Thu, 5 Jan 2023 18:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/21] gdbstub: fix-up copyright and license files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
X-List-Received-Date: Thu, 05 Jan 2023 17:02:52 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> When I started splitting gdbstub apart I was a little too boilerplate
> with my file headers. Fix up to carry over Fabrice's copyright and the
> LGPL license header.
> 
> Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/softmmu.c | 3 ++-
>   gdbstub/user.c    | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


