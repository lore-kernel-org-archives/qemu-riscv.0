Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTxB-0007hd-F7
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTxA-0007hE-CM
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:22:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTx8-0007Uu-Pe
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:22:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1841018wma.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ylKcpkWHZgkHqciFS3PTc6pROI+nTj0vsfG4lupU4fc=;
 b=Qtak04rDs48iN0UbCFzj6sXIS7Qf/4vd8+ZYPRl7qUEI2qkDAuGraPFkMW72WV9dyC
 XK/4BswCGE1EJq8kGp1RJPwtiewgFtSfWlSzjZNUvUVzmVpPR9x+31W00IcFjgtWZNsi
 nwj4WdKjtJYTsfJCd8HSjnXlGHwhhu9TFwz5UwY9pVZsNqK8p3qO0KqS2TAfMnE515VA
 e67hNR1sW1Q9tgN3U7VwNVR/A2vQtVK4bkteholyPmnRoNWkCi9DRzAAcVpE57SWE82i
 Mdc9yJmNXgRiyhiy85dlj+9uDNNy8zEJqfTftJ9B0Vfba0BeQVjuQcxVlp+lL7tC96vQ
 aQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylKcpkWHZgkHqciFS3PTc6pROI+nTj0vsfG4lupU4fc=;
 b=2MNQqeCNRuxTriLYCDbvtS5jSP/F0cMAuHzUXbRCNZCbyjvuxDzJDUaaj+Rw5BBRUr
 itPAd9GsUVr99wmy/rW0sPr3ZnaOXPVeBFgcv0so9ZEdPV3aVR1RIzNbduXJOUOh+tLA
 JZij9C0sTo1l7BWUnlNDbv7dMzi/ASR0D3mfih11SvywVprnbt9PupTvIRLkse259c9p
 y8UzomuImD2JM5LBK5fYHnvabToVnwORyv/O9I6iEAZ9zbda+9/lyWUsAK98cBOOfjCS
 eMtXVdheHvbWZMVfYgWUJjngMREbjYUWgdRCd+KIH60uCJKVBq3o14HiacL805a7pX+h
 p2hA==
X-Gm-Message-State: AFqh2krw/c8ZmkkllRBENwjNPpUuBRCECKz9fU0+oJHetIE2WanEUjbc
 DE2GuC13VWerhz4dJ9yHlG05yg==
X-Google-Smtp-Source: AMrXdXvEeWn7Xu7HP8yM4dJdtXlej7ArIR+fWdPsZg+GugRgOgv1vRf8kEtdaVGKN6RzWw2EgFN/WQ==
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id
 d20-20020a05600c34d400b003cfa39feb2amr36839330wmq.11.1672939373107; 
 Thu, 05 Jan 2023 09:22:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003d96c811d6dsm3321992wmq.30.2023.01.05.09.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:22:52 -0800 (PST)
Message-ID: <3aed1547-aedd-7856-7ab4-4d2ee9176c1b@linaro.org>
Date: Thu, 5 Jan 2023 18:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/21] gdbstub: specialise handle_query_attached
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
 <20230105164320.2164095-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 17:22:56 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> In both user and softmmu cases we are just replying with a constant.
> If the linker is paying attention it may even be able to sort optimise
> the call.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  4 +++-
>   gdbstub/gdbstub.c   | 15 ++-------------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 15 insertions(+), 14 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


