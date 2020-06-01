Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftRP-0003fs-NW
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jun 2020 19:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftRN-0003eu-PC
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2020 19:01:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftRL-0006Wl-Gi
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2020 19:01:56 -0400
Received: by mail-pf1-x442.google.com with SMTP id z64so4147283pfb.1
 for <qemu-riscv@nongnu.org>; Mon, 01 Jun 2020 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MBwhioOTO5IwQ4eAH5O+LHoa1q/Fp8wPnF66132BV6w=;
 b=I62oPMhOzcriXPS+ul3GZ3PSdaR6gFw/VI6rYaWsgLSZ8o87jK+qiDYX1EXoNw31kS
 scLDgckCgcxRHkEg2fjgKy8bxunKvxEbslJjfLH2fy6LaM5eNGEKJXSuqKC6HIfcu6G5
 1sjdhL18favA4hRG5Svk//8VYxkYwBXOdsyzPGIGequ1KZD8lvxcSTYDWVUjPWFsYFo7
 tEsmo+bc63VDHcpSunMCcQE0u6kp0t20Ilhr9e1rBr3RtNQD6zpxOYs4m1eGNc+1my7L
 fBc0NJ7WzwnfwqzlafdSBOIIPoXNMPtcJ/S/aoEuXd069UT9ifyzQRCxjdFCXMxtOv9I
 tT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MBwhioOTO5IwQ4eAH5O+LHoa1q/Fp8wPnF66132BV6w=;
 b=Dd8hN+NrQ9yh2q6c9np6qfG9P+/3RIrNZj8KvJiVjpfbFPW+J6YbV0kex7GLJNVmo6
 rc6KVBfkrLRL+4nf3MnYMsSgGFV1sCly+ZfaCW4TNdChzCy/Ic83/X5H+ICro0IZH2P9
 Hq6UfT5JFbTqH5Sb3ZByIhzEMNxLw5gDMSXlzfwlzRK2SHeXGgpyPmcXF/KuUNGD52+9
 Qo9eVghJ8lvPy4dwrQQT+R4T7Vr2kTw4swOAzoBkp1DgIo9xM1jmgRJmpF3Q/EFwCFWk
 2sRSu4K84eaXk0ktj9AA8crlf6tu2u+rVApewlWCMespwEzOUEnz1Zg7pZuRxNyrzXrv
 GTug==
X-Gm-Message-State: AOAM531B1SgkqTW0RLV8zOt4jTFBeWbOPwk4gV9AnZVdhm9bAA4v/g3H
 jKnYVAcuzLcC5fkud1n4FX4B5g==
X-Google-Smtp-Source: ABdhPJzPvt0OpTdpG2XOZd3WyGBlDV5YaW9zwKW7qD/jD4rhJEvrl+u/NspFOTeBnPF68PmgpH6SyA==
X-Received: by 2002:a63:4182:: with SMTP id
 o124mr20869141pga.195.1591052509510; 
 Mon, 01 Jun 2020 16:01:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u21sm385591pfn.123.2020.06.01.16.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:01:48 -0700 (PDT)
Subject: Re: [PATCH v4 13/13] stubs: Restrict ui/win32-kbd-hook to system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200522172510.25784-1-philmd@redhat.com>
 <20200522172510.25784-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ef88218-960e-0779-e40e-13ec300c3dad@linaro.org>
Date: Mon, 1 Jun 2020 16:01:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522172510.25784-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 01 Jun 2020 23:01:58 -0000

On 5/22/20 10:25 AM, Philippe Mathieu-Daudé wrote:
> In Makefile.objs, the ui/ directory is restricted to system-mode:
> 
>  43 ifeq ($(CONFIG_SOFTMMU),y)
>  ...
>  65 common-obj-y += ui/
>  66 common-obj-m += ui/
>  ...
>  82 endif # CONFIG_SOFTMMU
> 
> Restrict the ui/ stub added in commit 2df9f5718df to only build
> it for system-mode emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


