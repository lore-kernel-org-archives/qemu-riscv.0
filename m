Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHJto-0005VP-1i
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 00:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHJtm-0005TL-CV
 for qemu-riscv@nongnu.org; Wed, 03 Mar 2021 00:18:14 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHJtj-0006Tp-K4
 for qemu-riscv@nongnu.org; Wed, 03 Mar 2021 00:18:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id jx13so3432547pjb.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Mar 2021 21:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
 b=IzHU2gMEW6+G+HK19k+gbZqm4AGTLJGQegpBwEtRhajjiHX5XIkF0gaPSWAL8oO+1v
 DWsLU+SZyjY6k+D4sPsZKwiLk6zAIpkUhfxfoMnpYNDDgSctzm13BMszfAlWnSGX32Tb
 IBMmAQ1pgzbSE7zjnViugyCwxAU6759qWbtdeiNTc6r51rmU8QnDDYzgQGfod+5zXR4j
 n4L3cGTgcnMLV7L4uxtZGmP+LQ3hItt4MiLGqEiut81yDw5wZerDIedaFOrpEMSCuL1N
 5yobfE92WuT7LkVWGP5BvKyOi082t051kAp5Vj/DJDFX8LQNq1TM7vYwzPl+ihvbRCr4
 GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
 b=PJuWrYnhemp6tY7kc9bv3WmDINC6fTllDzpVXGN0gVg6dapHCUcMvxT3YYuMZPDofc
 g6Fu2xG8CJRp7Rb3mkVrF0no9t2/yatbHPJVhCqWGn7BY6hfrEwYUDf5Vpwe410dB+rT
 Oxqd50UzxL2tDL3Vgk0HHYsACoz8CKGVPtpDa+eMSyjEA0oGYRONJT7XEmW9A+SsH9MX
 aGli6B5PWNdQizWKIp/ikUrT4XJ2bL9oZUvPCA1htAak7al7qsmhdDiFKMgRFgi+Jxu+
 ZjM6LNqqDlcAJAOqvCz2PxUgnJaqUlHCsNffakuMNWC3l9wjllkMLKrRvYqv4oSnVyF+
 dIqA==
X-Gm-Message-State: AOAM531x/99txyU2R9bA8FCTCMd3idI28U7I4BMW/P2S41tWFQTvZH+h
 HKulilTgo93Wi6WnjJWiLhmzfQ==
X-Google-Smtp-Source: ABdhPJwz+61Con5/jPcUXcTXucDezIVmIHEdMZ6biJz9zoJHDglHA31VKNet9fHJ7jd6m9TPq81DVA==
X-Received: by 2002:a17:90a:788f:: with SMTP id
 x15mr8335208pjk.70.1614748689249; 
 Tue, 02 Mar 2021 21:18:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q15sm5885510pje.28.2021.03.02.21.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 21:18:08 -0800 (PST)
Subject: Re: [PATCH v3 07/27] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Anthony Green <green@moxielogic.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26555b24-cba0-3c3c-daee-142b16176fd8@linaro.org>
Date: Tue, 2 Mar 2021 21:18:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 03 Mar 2021 05:18:14 -0000

On 3/2/21 6:57 AM, Philippe Mathieu-Daudé wrote:
> +static struct SysemuCPUOps alpha_sysemu_ops = {

const, for all of them.


r~

