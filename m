Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDU0y-0002Pm-5j
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU0t-0002NM-Dy
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:26:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU0p-00006T-7D
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:26:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ja17so28536840wmb.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
 b=x2O4i4Yvt+VOEEhJTeqBAX2ZZH9HOGHi9BCYO2B50iDwu9plmEH/dXFX7RX+6DkTQZ
 LG/Rc2Zh7NiQ67BpEaQLXVD/0HqDo0LN/+1tuXesvbunNeSDxpZgWqziHbRUpAYw1Zbp
 7BxZYB2X1PrHDUnPCTvLWG4B+R/AcJDXcectJ4H7LlEqKsn8SScgsjr11E8F/dGwtA1y
 YfwiKIVHokOgU2rIdBnkExAT7D9hLv0+73nBMzwJItqTHF6qHApQgIqxszEBFWL8tYZ/
 YPWxlQNSmnmgUMtu9hcJm80mt/FbwQYL0hT0cPRf4nhnPJiPw1fHxud3TLtCz3S84qYQ
 6Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
 b=RMOEjPPuv9dut6yDx91bac0jkBzcriKpHMk6lpaT0yZ/1ec92X0tUFX5Gv3u9dvLAF
 dbf9iMm+6Cetg2nPmen9sfu1tzIHz+IIURXXsyiP9sOk86kbmbPGKAde7+u+G+56v3ok
 h2hMqcRvmA8kRtEbWOHZHTDkVncx86WE00IhbHgTAJd1gaB796+h3zhQBtW44+h7g4y8
 c20NxPVwPuP5FKE29nPjxo39n00OyjYrnis61riYcV4ebuQLETpa+EusqCeR732hWF84
 PN0ruEeHEG8Rz5Yr+CDc2Xhba/ppUQXGnKoT3DaY5nbFrOsdf8lrRaGkX258CyloaKZr
 RU/w==
X-Gm-Message-State: AFqh2krfxrmPNbQEDrha1Q8DIBBjBI2wESXkSPv/5gDvmo2mRYm1AhZp
 4z5Xjya03xNEscUrSmvKJU4umA==
X-Google-Smtp-Source: AMrXdXt4tXUQ+WgtBP8T0TQkuq3QEoOCebVqsYx3qjzPi4ZeiOLcHp/FfaFFQkJQIJhddq/US5ii7g==
X-Received: by 2002:a05:600c:d1:b0:3d3:4d21:704d with SMTP id
 u17-20020a05600c00d100b003d34d21704dmr37046020wmm.14.1672939601883; 
 Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm3158151wmc.13.2023.01.05.09.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Message-ID: <bdb3339f-e753-7911-6767-98b1279d311a@linaro.org>
Date: Thu, 5 Jan 2023 18:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/21] gdbstub: fix address type of gdb_set_cpu_pc
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
 <20230105164320.2164095-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 17:26:48 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> The underlying call uses vaddr and the comms API uses unsigned long
> long which will always fit. We don't need to deal in target_ulong
> here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Yay \o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



