Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6UBH-00086q-AZ
	for mharc-qemu-riscv@gnu.org; Fri, 14 Aug 2020 03:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6UBF-00086Y-JD; Fri, 14 Aug 2020 03:31:13 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6UBD-0006UJ-6u; Fri, 14 Aug 2020 03:31:13 -0400
Received: by mail-wm1-x341.google.com with SMTP id 3so7119506wmi.1;
 Fri, 14 Aug 2020 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SUzPO0rmg94uDA0r2cz+XDec4sVmrSgtOpeeLY6wdrs=;
 b=BdOedG2a5UpbKPg9piFmMy6w6jUTPiG9UfZHhwMJ6J4s+EfpWPDuqmiTZaFBMdRwqU
 AVcH/TNOZfx0oUT/TEMTUK995KsvePHG/XCE349eV3qc0ysbeEbqxwfLyYZs/EezDkiG
 31mGq5rZ3oYGWNwMJxFSb1WoH+W1eEHik7fwOYzfe5FA8QJxTCtDn/kfiNItBCSg4Dxl
 CbH0Yv4oy/OEqka1amCt2O1IKwU6umUfWVqGdAhBID6liizFIN0YOUR2lEoHo7nMO0xr
 ZudkzlJCHphuuyx5xlyWOHxbG7d32Q/oeQWM34hZ8WgXk9Pej6a/KatzkEz7rXYifskq
 7VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SUzPO0rmg94uDA0r2cz+XDec4sVmrSgtOpeeLY6wdrs=;
 b=pzeH3864LOgWYss13tRsVZAWc0wOJZXx28SVEp9ad6rtlf9a/uQY6uJ+gF2ker6OBN
 YjCbhNgb65IbG2MIu5fiLJc/gYbeJkUu8iJ62acDHRZp5+gQniRp5jHFnGcAp9a5DY3L
 k5wz2jbAwUHV9DQcdA98YskHDRz4RVdSly7QijLo1jFRfNNWXo83xQhIVK8nGdaji1Rh
 QgJS5zaJ6NVAYnDTXsofy5TTq+ocx/QuEUaTbbquv/BYIyRZvXMvhmDyyzYufIpJmv2X
 LPJVMq6TOoXgAScW5ag7Ow1uPdeBy6juQ1QeVdtBXsOpg2J83ysZh2wmGdi+k0Fi+IlP
 EdNQ==
X-Gm-Message-State: AOAM5312c77FepCrMKnLECy75WCI85Kb6Nvbm0uzjuglWL9i+DS9tfk4
 5JTk/E/4qHGqmxYRLOjQ5g6NCfJ8tO8=
X-Google-Smtp-Source: ABdhPJzc5idv6qBouuQJdKu4+ban/H02JIadMRQuTVnaPXvqS1PVd5gER0dJgdg7L4OCc8hixQWLHA==
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr1309695wmg.128.1597390264782; 
 Fri, 14 Aug 2020 00:31:04 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id x82sm13240038wmb.30.2020.08.14.00.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 00:31:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: QEMU latest release riscv32-softmmu not working
To: arman avetisyan <arman.avetisyan2000@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <CAK29XkHKxt94TPFwwuTy78Ye1Z9=-zxMe77bx7R+xxtP-nmipw@mail.gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4dbe759-a360-efde-17f7-b67c8350c899@amsat.org>
Date: Fri, 14 Aug 2020 09:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK29XkHKxt94TPFwwuTy78Ye1Z9=-zxMe77bx7R+xxtP-nmipw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Aug 2020 07:31:14 -0000

Hi Arman,

On 8/13/20 10:20 PM, arman avetisyan wrote:
> Hi QEMU Team, having issue running riscv32-softmmu

Cc'ing this to the QEMU RISCV mailing list.

> 
> After running riscv32-softmmu supplying custom linux build it crashes
> and complains about rom segments overlaping
> 
> $ qemu-system-riscv32 -nographic -machine virt -kernel bbl   -append
> "root=/dev/vda ro console=ttyS0"   -drive
> file=busybear.bin,format=raw,id=hd0   -device virtio-blk-device,drive=hd0
> 
> Log:
> rom: requested regions overlap (rom phdr #0: bbl.
> free=0x000000008000c160, addr=0x0000000080000000)
> qemu-system-riscv32: rom check and register reset failed
> 
> qemu version = 5.1.0
> Pulled from github.com <http://github.com> (latest commit in master =
> also tagged v5.1.0)
> 
> Same files are used in 4.2.0 and are working fine.
> Tried different kernel files, all had same issue.
> 
> How can I help to debug it? I really want to modify QEMU to support new
> board/machine but having hard time building latest version from github
> (which happens to be release v5.1.0)
> 
> Thanks, Arman


