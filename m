Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3kbN-0007xs-J1
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 13:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3kbK-0007vF-DQ; Sun, 24 Jan 2021 13:59:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3kbJ-0002Rx-2R; Sun, 24 Jan 2021 13:59:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so10110960wrc.7;
 Sun, 24 Jan 2021 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uDfVHZ5zw5furKJGvhxQjJ3ZeOjPppkwAjg2sHNjxUI=;
 b=i7e7t0NPORV4pwM674j0QktFYERbFaKd8a9+730/vGiWM0w95LizN0XAvUCgwOUsID
 ejCnWkwitAVQQLLUE+UamvWWLQnMA0pjhL97SVPnyihz1reAGUSYWFk0LbMMm8Gm5tvj
 lwM0n5FawYtC/ls+aCr1YKOvWHRTwuRV8KTFuCS4nMle2ibdmiyVklhyFA7e21JPfY66
 e7yh9SMZDfNnT3XeJuPRGvrtAsKhtX16pQ7E0iNziwSJd3ED8OWAm1GY39ISF6HgRRfH
 S4dUkSBLxd/4/N8tDIEZZejxLBWJvlqV0Afwn9Xuv6TuKAcNoThJVRWA7b/x+g2CZ3pL
 2ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uDfVHZ5zw5furKJGvhxQjJ3ZeOjPppkwAjg2sHNjxUI=;
 b=VgihQfQ+CFknQaNuY3JC897sLdQTef4CkB3AU83pl266elMVha06+ZYYn+DJglfaJ1
 igbpO5kGvsZRyokt1P/0Vn0hxoqqJLRXzcV0Ya6+dzSYYxCDDu3lHvLrFk3PHN+ZSgAA
 jdBon+3Oc1CjFOLD2G5u0orK0HBJ6RC9ex+O9oQIZhyzPOUn8ysTKmda6k0Mu8ZafPMH
 LYKZ8CymqzgdRTt7ODoFsl/GuMw0CmWHdwwb/9jwABm9Hxf6dKeogGzcleULD0hZqNk1
 C9e1zwnbs/SGlToXh1eFkI4gEYcYQQFqfMkYQ+lnmhgO7Q8et4CVtk6CKQ6FMerQoQRi
 1n0Q==
X-Gm-Message-State: AOAM5300R497vUQdx2X5CwL59GdD1SqPoDBIhjz8sN13P+N7bg4firgI
 kMastqh9U0RPUuhSdWJ+Ky8=
X-Google-Smtp-Source: ABdhPJxsUA6ZucgiQT7IqUrXk5fZ8feAdPAKXigznrkqeQnCUFD0kNgg2fWMZxKvPJovV6EKZafZiw==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr5401174wrt.388.1611514743159; 
 Sun, 24 Jan 2021 10:59:03 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p15sm19921050wrt.15.2021.01.24.10.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 10:59:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 06/25] util: Add CRC16 (CCITT) calculation routines
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-7-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
Date: Sun, 24 Jan 2021 19:59:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 18:59:07 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Import CRC16 calculation routines from Linux kernel v5.10:
> 
>   include/linux/crc-ccitt.h
>   lib/crc-ccitt.c
> 
> to QEMU:
> 
>   include/qemu/crc-ccitt.h
>   util/crc-ccitt.c
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  include/qemu/crc-ccitt.h |  33 ++++++++++
>  util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++
>  util/meson.build         |   1 +
>  3 files changed, 161 insertions(+)
>  create mode 100644 include/qemu/crc-ccitt.h
>  create mode 100644 util/crc-ccitt.c
...

> diff --git a/util/meson.build b/util/meson.build
> index 540a605b78..05a376ae02 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -29,6 +29,7 @@ util_ss.add(files('qemu-config.c', 'notify.c'))
>  util_ss.add(files('qemu-option.c', 'qemu-progress.c'))
>  util_ss.add(files('keyval.c'))
>  util_ss.add(files('crc32c.c'))
> +util_ss.add(files('crc-ccitt.c'))

OK but we can restrict this to system-mode emulation, as user-mode
and tools don't require it.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

