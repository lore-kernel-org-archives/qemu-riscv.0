Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMG21-00011A-57
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG1z-0000wP-SK
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:43:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG1u-0002cs-7G
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:43:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso338368wmr.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
 b=sz9KbnkkagCr/GFF3OMVQhtS6VhgzaCiOfnUEvPJVL2O8jwbbscHft/H9IJkpP0NsU
 TGizEk76lcvi8mLRugPLNXDpebTnYO3vqlZQK48MJI9TPSqJFF4fhUuswhN7CqY2Ghwk
 3vqpHJ2pzTxkD4Alw5fP1VVDaMLadtQr5cqiT1MBE/uvf9J116rMMc6TMrhbx3UMJdIj
 /DMhuBGeqgleldVui5C3jsYuqvxxkrLkQtp2u6KAbqe0LNNwZJBYdNlmGqmCrDRJX6/D
 H9oo/QoelvlvKhE6ZH5vxKSx6LJafL8LYNlCMQZjRXX4mct49OSCXeOxBiNBVInXZevi
 wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vBLdwX3ZChNXVS/9UqNF4wJjMelZK55qA391msJX3qU=;
 b=p/dZ9tyTea/rNIgv6O52GFk3XVQJlweQU5D2vrPZw5mKqEmUf/ZyFEna3AjTpo0PgX
 zIXBIvoDmf42gIGrLKh/hnHHradnWvDG/Fng+FWvzvyNggq59uah49MIGCSoNC1gD4lx
 fnO7PkQW3d4upeD6wd4kdWCmgaCP5JVqJiynSD2putoofigFdbH5FVIpcyLp0hGpnqpn
 h1H16Rsm75NQ/YVjf65A+LsZMbdJ+lINNBtLMTxsaFF6UGjyqbaFt6Ydk1Va+En8f3D/
 OwmBTGP/oA5euKMCmb+e6/NJU7TVHTasuZoxW5J3Ti7Gir16MLqneh3STussyyN1SDim
 OdeQ==
X-Gm-Message-State: AOAM5337pLgyi4msEFSobqjan4Ka1W6EXhCFi2LViBXsP8PlsSg0k1Nw
 zk+tBPCu9Rm/D0J0EclkSJMg8w==
X-Google-Smtp-Source: ABdhPJyTwcg40ZXBf0kRQeFkHvEtxWVastgigZVfDdU3EBMLa1vjXC+xX2MEzRyEH8NNNNiGPWLbnA==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr479522wmb.11.1630701796724;
 Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id w9sm294701wrs.7.2021.09.03.13.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:43:16 -0700 (PDT)
Subject: Re: [PATCH v3 22/30] target/ppc: Simplify has_work() handlers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <007f0874-b82f-5853-0c08-00528fb22bcb@linaro.org>
Date: Fri, 3 Sep 2021 22:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:43:24 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> The common ppc_cpu_has_work() handler already checks for cs->halted,
> so we can simplify all callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 294 ++++++++++++++++++++----------------------
>   1 file changed, 138 insertions(+), 156 deletions(-)

Well, I'm not actually a fan of this; I'd rather the outer function merely dispatch here, 
or preferably arrange to arrive here to begin.


r~

