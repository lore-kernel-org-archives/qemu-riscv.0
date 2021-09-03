Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFlf-0007Dn-LU
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFlc-00070H-9e
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:26:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFlZ-0005lK-FC
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:26:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id m2so111290wmm.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9EhQsb/ACMR+ZUYvfsQ8sm7Iu0dalRztguOzy6Crcdk=;
 b=QYSXBDXbshWafmBVS2xgefEvLphaKwA0sQfPQhGCg4AdEMozIzMcXqiXVGYB7CIewz
 jGF6cmCkebhdq+OE+6RWrDO4qTxvTVl4BSUMt65GZglcAtMPB7hoGF8O6DZlqsExbX4s
 XAzARgy5lmbAjguMkMH9lOvN2ERwa8Zk1z1kUQwdBWqSZWZPNk39la+7ZY1kN/pV4gyV
 RBRSsHPMZGhaBmnt8AGJWS+r15xgowV56WK1jX05FsVJKFg3NVzyfEkg92ZjiSGXwFOY
 XPliUy/Mwpe/M5POTE0+dgsKNGe4w2JH0ejOk5iEpYzt1oiH6GsVpGrvEbVnBC4nn0nZ
 rJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EhQsb/ACMR+ZUYvfsQ8sm7Iu0dalRztguOzy6Crcdk=;
 b=XqAYoTdEmjZQ6rE3SqbAZDNZPfFp3DVixWsfNT1SA2pnrvNGG2fIFDMdnU/dvEinCj
 T8/QzoFD8p4OmSEJVRO1ONLYwlswHcNgWuUkmX2+l9Ea1htHUOYcDJ2P/PCK3eV+Xpu2
 t9XvxjSap29dSebxybyICjqUPo95v8dJBcNQ638QxrNdUpwFAixLf8AUFiJrAn3oFBHi
 wjxx4in1nAv0vWsJI77h7/h4svgkAOqSCINQ4LIvVcv0Cv0ZWJPffM02cuxaMYYAd4pD
 AXsQ6lSC9Z47T8rIW5HuO+YUdLcZ4eo+df3nlwWPCHBbKal4XGJvJAt9cUllVUTnU7CE
 +Nrg==
X-Gm-Message-State: AOAM532WAiiI0Ujjib9O4qxbstArkkHU0aAUE6wlwtZIbfNQLD5K1OpA
 +u+NV6vw2b0mQ1ZFstuX+hl2WQ==
X-Google-Smtp-Source: ABdhPJxBhvIh1VZtcwLHBRW/mfjmLMhAmkSWajrXDW4E0STizvGidXuGiX92vd10z3qXEwsTB/9ddw==
X-Received: by 2002:a1c:202:: with SMTP id 2mr456635wmc.122.1630700783750;
 Fri, 03 Sep 2021 13:26:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c24sm245010wrb.57.2021.09.03.13.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:26:23 -0700 (PDT)
Subject: Re: [PATCH v3 17/30] target/mips: Restrict has_work() handler to
 sysemu and TCG
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
 <20210902161543.417092-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f24d9add-497c-8342-f37b-3d299a383d73@linaro.org>
Date: Fri, 3 Sep 2021 22:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 20:26:28 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

