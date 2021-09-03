Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFXG-0000XV-KM
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFXA-0000WL-9z
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:11:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFX8-0001Zp-6y
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:11:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u16so300890wrn.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EaCWOOldFpTJW/62GNcO8hnd0wqc8elIcEfaX69jVvw=;
 b=YyrzMqwR7pTY4UVwmQkF/b6/6vs1u7pbVcrnFbJ2IcW6P4fipRJVT8PmaEsbbFpg5m
 Ymv96X1royzInIGobPF2j09Z1yc16HGEdliJIXhC7BdkL4CkDrSv4ViHU6bzRWnn7dZV
 qZBXE7dHM+4+DbAAXk77dXGymyVlTIpYSq7C1i3JEZlTfiNoWgj2wqws++sPnSgcptat
 mA18BowRdXGHFl+/0fRO7ZQ0GtRH00yJ/XcRK/OYqcLDp/RR8ktqw1Cg+Aoha/XNDyBg
 8cWnsyWPtksyXCOTBNPJZ0SnF8sr/Z1rLMwoCoGs5MDwwc19FX55U9jh0cE3apvw4e/O
 +6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EaCWOOldFpTJW/62GNcO8hnd0wqc8elIcEfaX69jVvw=;
 b=hIOwLvDPYcXNV17ZObIM0QQmATpfYT/eLvhd6WecNPr6CdD5Hx4Wrn+wgUt6uTZhmB
 yEzGkKaGIUxdlL2XR6kCadUeQG1Q2vr5ZIxEEfp723R2dp7ZBLNPVeB9VeP3957PynX5
 IRDg+ZWfCWzNe+LOoB25tGn4z9gOTdHdKu/XdOjdvmYTdAaq0+e6rBZpJfDXAeLhNSe2
 RYgomfKHMQw2VMEk0zLU6JLECH/joYyBftNVmiDXbnMcSj479bJP8mU061hwtfuerWlI
 bsZS3nCohtkdSl5odJO0vTdlLd7ugm9SFJqIJ4q+tqnziC86KjTS/ZVh2XqcOvOG5C0n
 6m0A==
X-Gm-Message-State: AOAM531EdNF2vQM3GEHOktwW6uWa9F5zEzNOcfQa/N1itU23ruzZn6h5
 34+TDNuCfhVCfIoeusCjLiENqw==
X-Google-Smtp-Source: ABdhPJwhD7ZLlhNK9IfRlsfSxTpaQWDz0Xn28SyMeYUyzG5cv49AdD3Ojc4LM0ShmrKJ0X1u+d3JqQ==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr758059wrv.367.1630699887867; 
 Fri, 03 Sep 2021 13:11:27 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id o26sm331500wmc.17.2021.09.03.13.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:11:27 -0700 (PDT)
Subject: Re: [PATCH v3 02/30] hw/core: Restrict cpu_has_work() to sysemu
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
 <20210902161543.417092-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2f2d27-cc3d-c398-74a0-c0ca439d84ef@linaro.org>
Date: Fri, 3 Sep 2021 22:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:11:33 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> cpu_has_work() is only called from system emulation code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

