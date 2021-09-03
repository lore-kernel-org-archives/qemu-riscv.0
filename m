Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFep-0001tD-KK
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFen-0001o6-Q3
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:19:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFel-0007vd-0P
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:19:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so288851wrv.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
 b=UP4L3x90K9R0Xv9kUPD2k1ldA8cppgKzxB41aZwVXYD7x/qndJVah80MG87/CBUxKF
 TQsp6BHab8hbEiq0EVctWDjgUQRASZHj3+eAB2JftZU4rDgjFNuJfnOUODTXjmvHq+Wb
 CO5SRo4MZKWNpVLFkz1S9LBbag1wL73cRaGdVxll7VdzLyexwvlp0cZN9dy4/9ct+32O
 xuGIsIHPC9o6Pv+TjnwbzRCalBEKUw0bgwH95SVmBcNFszNxj5KOrbihoohVlg16IcU/
 cuE0LBDTSZg+bzpqf7VDLPEdO9axqPBJ8doVS6whQR+pz75s6Bv4Yx4dkv7Omkpgzy1I
 2uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
 b=OT3oy3djb6RRcp+X0yNXa06tcmvtGUKzVPhW0B8MgJeU2kZTx3tZIUtTvmlopIxkCJ
 REtEzddwcCxqUEV7IRMQ6dnpUcxG31gAqpn3C84ml82g24gg9BWiEPVNpGOrO8axHoz+
 8T/4Db9qtmIQlD/2YMwVmTSMnQdhcUSXGm7zf+hl/Fp8iIJDx1IPFqhM0JFWIe2AOF2D
 mt+dTCZEnXbEWCZby+TXUMD+Rb+E8s+aHNMFyTAaXz02xsmMdcVJ1tXLCQULzYA4pCG0
 8HAlu5xduF9Ct9gHVCH/Ic9/Er2+aGSlCbMr8Wx7pdLHyO2K++57Dk6Am/Evhw+tUMZt
 nTdQ==
X-Gm-Message-State: AOAM532XiPUHIaT795C6K58JE6QxEldyYH2GRpWGHHWDBm+NhRI5cnVb
 4p7eZUf8GlHCZ2kuqxOrNqddRQ==
X-Google-Smtp-Source: ABdhPJxOkyr3cz4gxEh2Ke6ki62uWZywliZS86PJZb/UyH5xriM04K4qsIBYKGhxLIpR8DxkeTkVHg==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr826597wrc.190.1630700361562;
 Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i4sm360865wmd.5.2021.09.03.13.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] target/arm: Restrict has_work() handler to
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
 <20210902161543.417092-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <318478f2-6cea-e9ee-dc9d-442589aa8f56@linaro.org>
Date: Fri, 3 Sep 2021 22:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 20:19:26 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

