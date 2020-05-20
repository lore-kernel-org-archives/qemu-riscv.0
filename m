Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbHnh-0002W1-8m
	for mharc-qemu-riscv@gnu.org; Wed, 20 May 2020 02:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbHnf-0002Tp-Lf
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 02:01:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23609
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbHne-0001ZZ-8o
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 02:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589954512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2erczWdPet2g/DXKF5G6tIZ+qV3qGTsEoAIPBJfiGSY=;
 b=SEX5U/EBVV9SltMmHhLToBnZc9r98X/8Rl2ct3WB0kzDKtEs3O5QD3rYRc5tLpmf4CWCiY
 1IvugMBTiPxthRoPZLfFtIqt41IqC2/qZmeG/mbhOmLSerEw1CeIBFQPc2JgaWevkk5t9m
 xdqQT9Ss+s+nA8F0hI0cDPY1tusLzz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-wT7mdcQTPn-R5XLBC3-GIg-1; Wed, 20 May 2020 02:01:51 -0400
X-MC-Unique: wT7mdcQTPn-R5XLBC3-GIg-1
Received: by mail-wm1-f70.google.com with SMTP id g10so773664wme.0
 for <qemu-riscv@nongnu.org>; Tue, 19 May 2020 23:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2erczWdPet2g/DXKF5G6tIZ+qV3qGTsEoAIPBJfiGSY=;
 b=kEjLrAFs0aXtSfWxDUd1oTs10A654EGDRWGZinDReRIbCelmAgfQs1UiWzxHeGzW/a
 GgoMFcb7nnRpuYSGZ8/LUf53JwXshEy5vD1ZUFP9qDoXNU1yYTAl//6ghTex4ox25N/D
 6KpM24pUigi2cwStRRw60Y5rV0PiIChQoo0wTip65wyfDzZhGijO6jwEraRup/eu1z4e
 rxHaF6DBuGpujmhb857LeroNfVvbqMNbrHhGPqviIwWlGlYy+pf76bQEmBigL7rqa7DI
 2jVvSlsbUQ7okYhaRvFSWhsnq/iodmxlTjRi/Tru7lRrfr0Dlx2ksnZ3QFkPu0edFB7m
 UOqw==
X-Gm-Message-State: AOAM531te/47IDtsqenrcz11UEnmHTBBhrwT1kwtx1LMT+PNrw0cJCDk
 75INoKlmzkUtHA7Wd5IWogMXDnLmc+ldxBItca6x5GbhTDxmvV7v6D+sGftvmGxc8wkN8HObgeg
 ZAbfCZ730OXkuYAg=
X-Received: by 2002:a1c:9d12:: with SMTP id g18mr2895916wme.109.1589954510144; 
 Tue, 19 May 2020 23:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKMKiV13ObV+xf/WWDyj2RvWjgJOx/l2/ZG3DeG8GuxqBKulQ0zPbAuuS99VhAtic17Uc7pQ==
X-Received: by 2002:a1c:9d12:: with SMTP id g18mr2895897wme.109.1589954509924; 
 Tue, 19 May 2020 23:01:49 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id v205sm1978384wmg.11.2020.05.19.23.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 23:01:49 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] riscv/boot: Add a missing header include
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com, bmeng.cn@gmail.com
References: <cover.1589923785.git.alistair.francis@wdc.com>
 <05ea15f2ec07e1c85273d4897d47c05225b116f6.1589923785.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0fcaef83-ec31-d5f5-4677-d42a77d90e3e@redhat.com>
Date: Wed, 20 May 2020 08:01:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <05ea15f2ec07e1c85273d4897d47c05225b116f6.1589923785.git.alistair.francis@wdc.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 20 May 2020 06:01:55 -0000

On 5/19/20 11:31 PM, Alistair Francis wrote:
> Currently every c file that includes boot.h also includes loader.h
> before it. Which is why the build works fine. We should be able to
> include just boot.h though so this is a small fixup to allow that.

What about:

'As the functions declared in this header use the symbol_fn_t
  typedef itself declared in "hw/loader.h", we need to include
  it here to make the header file self-contained.'

> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>   include/hw/riscv/boot.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 474a940ad5..9daa98da08 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -21,6 +21,7 @@
>   #define RISCV_BOOT_H
>   
>   #include "exec/cpu-defs.h"
> +#include "hw/loader.h"
>   
>   void riscv_find_and_load_firmware(MachineState *machine,
>                                     const char *default_machine_firmware,
> 


