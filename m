Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDToj-0000aP-E1
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDToc-0000TK-Ma
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:14:10 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDToZ-0000FU-Ou
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:14:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id az7so12388111wrb.5
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vf8r8dUCl69AOMhjLwN+zUZ5SufaucXG+NCekgjiuMw=;
 b=k+BySVUDQFoHBSl+qLgzP5BSNP39RyLjQBeBZdR5cL8TbzSgEVykYQkDupsunTKIw0
 +bYT9R/ep2jNDfxFFL7zZvYewa6VH58UBQCDRb19/JkhOekRR4jD+wavihhtry1zDdaW
 Abwy3BZ+TE8Dqn1qPzvC8hYCx6NXV73JT33kf9IbP2CASWt5qAJ5NuAVsJTEc8+M6Ssx
 Y4ygmEAK+xpktJdvYuJxzR3H5APCQabXsAkljKZpJ2IQujGWe/32jZW+fETQtV4qfDgh
 eJG0Lmo+Am05BR+VTQabeKASFuh2/wveXFcni+G6d9M1bBBNrlHjw1p3Fru6bldWLSF0
 k/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vf8r8dUCl69AOMhjLwN+zUZ5SufaucXG+NCekgjiuMw=;
 b=XwhikCDwxfEFOUQjjelBKXuta/lRJ+bjl3HpCZ1NtiAfKnxJTuENZRsyROeq3V/F3h
 xR7lAN8O58HRHt8AUJKBwTRT50FElU+Adp0TNq0Nn/L9NIgjdq70Hygb2dWm0ifxSlt4
 4FMCI93mXNFMnxyKu3yZCjk4djkPD7474mgfMZ5GMxqLA3rn5Ay89HGKhlmRCHLA0pQq
 3kVnW/KV3U8UAM2OleqAJAgcG2Rn2S4edZN5a5yxWOmIV0KNxFTd0YoTXopOleuYzFGq
 uoaSUmHUmrdolWdD+OTQEP8/Wzhi+gCZnYf9ex2mSjDfJeVDl3BV9wbSM0CZeTpVr4k0
 GrmQ==
X-Gm-Message-State: AFqh2krmxAHsTwZAxtZZORI5z4ch4EAWL2KlNYEsbiCi1k4X1vdLP01q
 z3X4esBFvSMI0+Sh6kotLJCQTQ==
X-Google-Smtp-Source: AMrXdXtblv5x/dcf+pWl6BYX+YPaXXjG7qp/ZPdTsXGXiMVFgjbb5iIBoGu+RgFdu2iYZsDi6wLzGA==
X-Received: by 2002:adf:f143:0:b0:2ae:b451:a0f7 with SMTP id
 y3-20020adff143000000b002aeb451a0f7mr2479033wro.5.1672938841012; 
 Thu, 05 Jan 2023 09:14:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0023c8026841csm36822861wrx.23.2023.01.05.09.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:14:00 -0800 (PST)
Message-ID: <27a8f6ef-b78e-31ae-6bba-eb3f106de9f7@linaro.org>
Date: Thu, 5 Jan 2023 18:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/21] gdbstub: abstract target specific details from
 gdb_put_packet_binary
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
 <20230105164320.2164095-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 17:14:11 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> We unfortunately handle the checking of packet acknowledgement
> differently for user and softmmu modes. Abstract the user mode stuff
> behind gdb_got_immediate_ack with a stub for softmmu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 15 +++++++++++++++
>   gdbstub/gdbstub.c   | 10 ++--------
>   gdbstub/softmmu.c   |  8 ++++++++
>   gdbstub/user.c      | 19 +++++++++++++++++++
>   4 files changed, 44 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


