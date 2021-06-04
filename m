Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpE8f-0005IQ-8A
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jun 2021 14:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpE8b-0005I4-23; Fri, 04 Jun 2021 14:01:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpE8Z-0005lp-D4; Fri, 04 Jun 2021 14:01:40 -0400
Received: by mail-ej1-x630.google.com with SMTP id jt22so15797118ejb.7;
 Fri, 04 Jun 2021 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x24ZIztqLfe5brbqebkbnmpwp7FeQCCWMk5tF7Z8QYY=;
 b=aUnu0/2EO1DKUBtZeCzPJob6upaK32OOk/pDm2JaBIYQccvhv1gm5+DyQI6CiAX30R
 iAp6bJd3zZSV+3HNiQk4YbDGxs4juC8YVLC3W1WpElunL1NgpL3/nIrkB1Gvc3E3zQbq
 z7nMr2uPnEb8orkZ5GYpxw4Mkf1ZkDUjpsksxk3Nbt7ZNxbMDlM+YoUF3w9ekyTWvStz
 pISdknknUHzKzE/lSkKbr3ZQqlOz1RTmvrd0CV700acKH8zKiBgmIHXKHF5dtu1qmNpO
 5cW6XtX283ONYTsBRkr4ujIVnu3z++vVc//NKcpzueVcuWUUOui/iMZEPH89htKgoK8u
 I1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x24ZIztqLfe5brbqebkbnmpwp7FeQCCWMk5tF7Z8QYY=;
 b=r7xkfAJYHK94celWmwLa93e4qKHFeuw9pL/175C9GNCqClAGHsRanOn8S1zSVhyoDL
 W5191BMCs4mXi8R0cyxyINd6yk4GsRhpJAN2I0Gni1neJI8LtHwb8DMcTTKpPm7hDnPN
 A+f/yUMFjU81CsgPYRffDUzBkEJ+DrwtrOiDtFzNq4VEtyXYNVoxHXJzdFRNjI45ub52
 bi/CSBnLtRkGBatK6OL7y4gW46pVyiMX/czkN2VQI/X0KiuZQUpW+FgU3hFgns2iw3gR
 w1VYKQqJAkzjLMEGu4lj+Dkl4NCWwAYJdS5go9XWV4gNG1jDEG/gy1f2BdoVqFZ/wp/z
 dzGg==
X-Gm-Message-State: AOAM532zqDEGHuUue2D8w10M1V7jS068ojIz/HwANzSC9yIrSkooLH2U
 EW+qLXHDJEWBm/tZOn4iz3g=
X-Google-Smtp-Source: ABdhPJx6qo5pOQzm/YfgRaXRHhb/Fgk35xyPwDkNcygNiIotPh6zBvmbnCE9ZErLIbM5MVDC7J0x6Q==
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr5466132eju.254.1622829695647; 
 Fri, 04 Jun 2021 11:01:35 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q22sm3068640ejj.98.2021.06.04.11.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 11:01:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v16 13/99] meson: add target_user_arch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2582589-c02c-cecb-024e-ed461e4ae1b8@amsat.org>
Date: Fri, 4 Jun 2021 20:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jun 2021 18:01:41 -0000

On 6/4/21 5:51 PM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> [claudio: added changes for new target hexagon]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v15
>   - remove duplicate ss.source_set for mips

Either add it only on target/arm/, or on every targets
but then revert 46369b50ee3 ("meson: Introduce meson_user_arch
source set for arch-specific user-mode")?

