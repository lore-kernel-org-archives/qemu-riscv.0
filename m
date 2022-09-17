Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZeyf-0001wL-Gl
	for mharc-qemu-riscv@gnu.org; Sat, 17 Sep 2022 17:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZeyd-0001sM-KV; Sat, 17 Sep 2022 17:03:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZeyb-0002jl-St; Sat, 17 Sep 2022 17:03:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id o5so14141974wms.1;
 Sat, 17 Sep 2022 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=BLNtggHH6XibgFuPu1J9nVzAuQ3tBj4bUfsxXtPz5KE=;
 b=qapEs7kiSWe0TgZqJNrO3YY+6iJjNsComEHvI5Ni0jaY+/zZIWWRJNMNW69pje7ELB
 usWEWgZNUNgObcOcAeuMpMmEujIl4/ReAfDOPJXNt+OP7OPUb4yXcpSwWJtw/HrRklx8
 C74pHMskxs+ocx8YUYvcOArhlAH7pjLOy9SfiAwYMYh/I5Qz4PfYES42AFdlPBEraH4J
 43we7V32pbowBvmN8ihENq7P3SnGAac8zUGK19CPUFY8HmYmiY1KvW3P0fh5ybsUnPXZ
 K+5+BOZ4GOkDId8ZA7Kd+A65b6fb8kolc2YMfcIIAWWnsIMjmrd5Pb93YlpiiQhlgjVT
 N8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=BLNtggHH6XibgFuPu1J9nVzAuQ3tBj4bUfsxXtPz5KE=;
 b=5iU5mZhCaMZPmf9NpgktxX5EUPvkmfMRMKmdb93HmfQx31TBI584/llNeuD69fnZ9E
 V+U16wWh+3nA77gB4Dc1BACqz7BMOz0VxChquj4Kqqy/mkhDed2lPc2+xvDvXSGi3+Uw
 Pfa3KhZTs3cBhO8Ep2WeqhNTMUIYJPSzJHDd9CGuo2Fgq/NHWMjYuiMF9nJEkuC76VHR
 U3EzU8H97yIUuaQ9UZ3OP4Ja5q+oM0HKGHH0rzDIpwuYiomwFRKLt7ycFNjePpl6M84l
 MzFVVsueZzEuOTiTlx4KeoUqCurpxotdt28Uev+Hd2c74Q37mkMH7RxZQZtJbpZVcF9Y
 VLzg==
X-Gm-Message-State: ACrzQf3/bn4IjekLG6kXmvbe0t6U+B8KEZRjKogwdDLAnvMoAaPdJVyt
 oDafBhqVHF0/VA+IP4Gz39M=
X-Google-Smtp-Source: AMsMyM5RjdfRMbL7Y4XIuHdwr9Kjx7Q8Ly8Q6Bx0xYrE4H9v0gi7S7I9PI3Z+KZTnsyWqX1jOKv4Ig==
X-Received: by 2002:a05:600c:3d0e:b0:3b4:9bd1:10be with SMTP id
 bh14-20020a05600c3d0e00b003b49bd110bemr7374064wmb.101.1663448628077; 
 Sat, 17 Sep 2022 14:03:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adfdbc4000000b00228c792aaaasm8702454wrj.100.2022.09.17.14.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:03:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <f225466d-65e5-16fe-3c38-ebde601fcf4c@amsat.org>
Date: Sat, 17 Sep 2022 23:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 3/3] hw/riscv: opentitan: Expose the resetvec as a SoC
 property
Content-Language: en-US
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-4-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220914101108.82571-4-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 17 Sep 2022 21:03:51 -0000

On 14/9/22 12:11, Alistair Francis via wrote:
> On the OpenTitan hardware the resetvec is fixed at the start of ROM. In
> QEMU we don't run the ROM code and instead just jump to the next stage.
> This means we need to be a little more flexible about what the resetvec
> is.
> 
> This patch allows us to set the resetvec from the command line with
> something like this:
>      -global driver=riscv.lowrisc.ibex.soc,property=resetvec,value=0x20000400
> 
> This way as the next stage changes we can update the resetvec.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   include/hw/riscv/opentitan.h | 2 ++
>   hw/riscv/opentitan.c         | 8 +++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

