Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMHjx-0003gl-Lf
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 18:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMH8Q-0000Wv-PA; Mon, 21 Feb 2022 17:26:22 -0500
Received: from [2607:f8b0:4864:20::62f] (port=39516
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMH8F-0007Dk-Ok; Mon, 21 Feb 2022 17:26:22 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 4so5371997pll.6;
 Mon, 21 Feb 2022 14:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GHbfz0r8Y28K1MesD1D9GggjrFseJpN+GKKHQXwvpMQ=;
 b=GBfbxOTjrqnnx3IocdocOOIWXN2XfKnLJgFne4MglodvsEKp7P8ccBumXnJKmIq5pe
 R4Sc5pud/scKNcDa2U+tDHyLixTbt+sgJiiIO+t61pGsdYATwwQUwSsOXi8Y5JnkNuq/
 5lkPH7TfJZr5Rk7TnJ0B3KuCtUjBDXjkN5Vh4en8g0XNb8s9zcey6rWF5+UKEa41S/W8
 dM8ox4KTWl5NZ7kJSZHKiaHc1aBHFZzr646O3WEA3uHXbodKTh0/9u3J1q81aF21GnlX
 XP91Kw8o4OrHOqUbtHh0kMCCZGEQi6/6imsU+Kp3tjDnlB6dejhzfs0gWNBzkt3jxOrk
 190Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GHbfz0r8Y28K1MesD1D9GggjrFseJpN+GKKHQXwvpMQ=;
 b=McpP8YgP/tU6IpZpT7N3d4oEGruZ75oK74Bqm62sGYEPclbsAlVTg1/fKYBIagOvLM
 g/mxLJocFWdf45D4BMfS1SgThJtxkTbL5dVlXQetiqhQ3+lfQK5t8jTrVPz0UkLCCypM
 BLg+wATbYVIL4KJJapArd2lnAL46GUqXMut8pjU1XdE3kG4G18TANM0XIxOV+I8EwZwh
 i+asn29BWJUlDeWl3urELhKuaos7enZbD3xpVgyX+BqSH+haDvmyADUnHwQSDMKH/llP
 RjyuQLl6gDJ6T1PuTY9XYxE10MGMQUd+XZ+J7M7UYcb4gRtA2WPiAC4amR7xKmNB72TD
 2s7w==
X-Gm-Message-State: AOAM533yJMtrzvy5yAYjzvSPdob6YoPgk2SN4cJcQ3GZCaPsMTlU9S2E
 A1YoO8iLTnW7LtKi1PCLOBU=
X-Google-Smtp-Source: ABdhPJxfBu7s/9V9agiYsNj3X64ieONaGcyB9rBbq6m3EqMdA+gq3ya9guN7Lx8qZgqdn3Ux7/YFlg==
X-Received: by 2002:a17:902:6b0a:b0:14d:8ee9:3298 with SMTP id
 o10-20020a1709026b0a00b0014d8ee93298mr20662439plk.125.1645482370013; 
 Mon, 21 Feb 2022 14:26:10 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id r14sm4802440pfl.62.2022.02.21.14.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:26:09 -0800 (PST)
Message-ID: <a0319563-d019-79e7-f36a-9e89522f1edd@gmail.com>
Date: Mon, 21 Feb 2022 23:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] hw/riscv/sifive_u: Resolve redundant property
 accessors
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220217225351.140095-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Feb 2022 18:05:06 -0500
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
X-List-Received-Date: Mon, 21 Feb 2022 22:26:23 -0000

On 17/2/22 23:53, Bernhard Beschow wrote:
> The QOM API already provides accessors for uint32 values, so reuse them.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/riscv/sifive_u.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

