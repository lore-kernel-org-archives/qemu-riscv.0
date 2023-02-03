Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0Y5-0001FU-0v
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Y3-00016B-Jq
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:12:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Y1-000141-OS
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:12:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id bg26so4530399wmb.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U3dvLLDT874bOnjAW6J9ENFX4iwJUHFOsTTPp+tlO/Y=;
 b=IFv9Ow7YxLKbM3JZPGOBSuJaF+KXI6xqMDbBthvgseh2hotD/JVtN+3ygbbiOVRGXm
 WZBwuxXrED8Fs5NRabhxNxKR7tcI6YcZTCKrOVxTBhSwEnaucar2hk9GCckzPVelflBI
 f8AeH0mfYmYp99Hbn7hU8Dtwug3WnFGUf3a1Y3SuFX3DlPRo7urBJEvFvfsW2s4f6XCo
 kk06RwKQMnTO/f7Z1bEaop/GaOynH5gQ6ELXjBLD0AhEUrSoTYmqhQHwMeL7G2RY2enF
 kMGgMXe8LrTN8VFt6d5nvXwa22H/Z8s0fxpq5AAMKWyLbOFIiV0t1W4IKNQUUHATSUKG
 DuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U3dvLLDT874bOnjAW6J9ENFX4iwJUHFOsTTPp+tlO/Y=;
 b=soToOuVrAgLP5FJ3JYHbqwTBaOok9n/J9wFMDlO/UgsONj/xlQUbnhw/gAFnGCaxtY
 QS3yx9NVAhY5inCs3mYdIXC7LXVmEj0m9k16dlbWVza9R7amsMdPGw/RWc1KOiELrTTa
 z/qxJ7izqOucT5YJir3r5FnWQPORGWQWGJ/dbnMoisKk9ask4WT66TgM6TqGouC3acRB
 Cfc+DKbTRsxHi+0EmxF0aFf9qFERe7EcLJtJuNMgwNg2ca/brqQhcOf5wLdZFB+16XEa
 N7g4Kj+TKbaXFaY2stdDX2T0MnewfOtKOVsCvSyFy3tku7n1i4l/zxzgvDFVXYMYo5DS
 BwAA==
X-Gm-Message-State: AO0yUKXRjJ+awzqtiw4Ics/SH8DkyhicnoWrB7uwONlk4M0V3u556DUy
 Wv6n7xE+QnXwC4ZtgBZyTf5vfQ==
X-Google-Smtp-Source: AK7set8IjqDK2c3cJrG3WSbhDgWahvH/QyEqVYbYyyh8ja2mGdjL6Kp3wUy92hOXXICQdNN8/JL+2Q==
X-Received: by 2002:a05:600c:511c:b0:3db:12a:5e65 with SMTP id
 o28-20020a05600c511c00b003db012a5e65mr10395159wms.4.1675447948413; 
 Fri, 03 Feb 2023 10:12:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w14-20020a05600c474e00b003dfe57f6f61sm3025017wmo.33.2023.02.03.10.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 10:12:27 -0800 (PST)
Message-ID: <0fc499be-7981-6a6d-9115-3c6f320b0c04@linaro.org>
Date: Fri, 3 Feb 2023 19:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/19] hw: Set QDev properties using QDev API (part 1/3)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org
References: <20230203180914.49112-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 03 Feb 2023 18:12:32 -0000

On 3/2/23 19:08, Philippe Mathieu-Daudé wrote:
> QEMU provides the QOM API for core objects.
> Devices are modelled on top of QOM as QDev objects.
> 
> There is no point in using the lower level QOM API with
> QDev; it makes the code more complex and harder to review.
> 
> I first converted all the calls using errp=&error_abort or
> &errp=NULL, then noticed the other uses weren't really
> consistent.
> 
> A QDev property defined with the DEFINE_PROP_xxx() macros
> is always available, thus can't fail. When using hot-plug
> devices, we only need to check for optional properties
> registered at runtime with the object_property_add_XXX()
> API. Some are even always registered in device instance_init.
> 
> I have probably been overzealous, so I tagged the patches
> not using errp=&error_abort|&error_fatal|NULL as RFC.
> 
> PPC and ARM conversions will follow as two different series.

>   46 files changed, 155 insertions(+), 221 deletions(-)

Forgot to mention, this is based on
https://lore.kernel.org/qemu-devel/20230203163021.35754-1-philmd@linaro.org/
"hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'"

Based-on: <20230203163021.35754-1-philmd@linaro.org>


