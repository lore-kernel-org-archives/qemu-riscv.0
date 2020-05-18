Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jabbs-0000ha-UC
	for mharc-qemu-riscv@gnu.org; Mon, 18 May 2020 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabbr-0000fO-Fp
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 04:58:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42811
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jabbq-0004Qh-Df
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 04:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589792333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdn8VCfgkteyNUxKS9hYGhs/54YrFa5Prt1Xdxt3huM=;
 b=NMiKiXnOZlFpe+FYAQ+6vhGKrWUpn9E/AsPb83b2nLE6T0hVLuBJQvt0EgxTYHln9rhLYe
 B9EmnHU6bwFd4OQenZ9hHV3s+D+zUQhk4arR/fWiG5DwO/0PnHPCGwVe0X9kDjX0WtypwT
 QzOiLjvrOsnvkAFkCA46tFGQWSzbPps=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-vlp5qjDHMOGCvpNJnjaY8g-1; Mon, 18 May 2020 04:58:52 -0400
X-MC-Unique: vlp5qjDHMOGCvpNJnjaY8g-1
Received: by mail-wr1-f69.google.com with SMTP id r7so5333961wrc.13
 for <qemu-riscv@nongnu.org>; Mon, 18 May 2020 01:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jdn8VCfgkteyNUxKS9hYGhs/54YrFa5Prt1Xdxt3huM=;
 b=PqBw+jPAR1pRgWJ6ZXWIhNKjcZmqG6qL9c4PK4JUY/lgqV+I1scCsTnfNp2Vp7ePah
 UWt/XqHIo9ju9hr9KfPjkn5NfqYulaYIXR99+x+NpETp7oDZq71buqrusxXf7oD6sn0w
 CKZNe1CBUXjQFYbns9AKOpISM1fIuvEIM2U9flcBffsnVXCi2IAinAUlwJDcBVYP2tMv
 eEWHT+ZhTN5r9JRNW6twyHsGA3aV8AUpi0PmTxv3cLyBd3YmF4iBZh7EZnKlHd9tFBIv
 HRcFaDAJpnzIlWdpi/gxttVYTwGtSsRNROIFkUit/bTMZbfl2EyiUQwL+X5t6HOzoKH8
 StYA==
X-Gm-Message-State: AOAM531+jy3MmfXjLDv1TSOV4ZIPk1o8344roX2w1iwG3hShpBjZZT9J
 gy3s6AHBjJ4BmWLx4DAz7eqANL3AObEazIWFKQ4yndFQplJfw+Nc3sPSJ+3tmJNzKRtMW5oq55H
 HPXeDaXgFQLTSZL0=
X-Received: by 2002:adf:cd83:: with SMTP id q3mr19349577wrj.187.1589792330770; 
 Mon, 18 May 2020 01:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybEUm5Wjpeg5HBMZkdte8hrlYhKBo3P6eIZw5TCJamsV3wELqc7F7hRZJnDryrOEG48bHEtQ==
X-Received: by 2002:adf:cd83:: with SMTP id q3mr19349565wrj.187.1589792330623; 
 Mon, 18 May 2020 01:58:50 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id t14sm11686202wrs.1.2020.05.18.01.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 01:58:49 -0700 (PDT)
Subject: Re: [PATCH 20/24] riscv: Fix type of SiFive[EU]SocState, member
 parent_obj
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, ehabkost@redhat.com,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 pbonzini@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-21-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f1312bd-4018-c1b4-4d1a-9c1a1a0c7e67@redhat.com>
Date: Mon, 18 May 2020 10:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-21-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 18 May 2020 08:58:55 -0000

On 5/18/20 7:04 AM, Markus Armbruster wrote:
> Device "riscv.sifive.e.soc" is a direct subtype of TYPE_DEVICE, but
> its instance struct SiFiveESoCState's member @parent_obj is
> SysBusDevice instead of DeviceState.  Correct that.
> 
> Same for "riscv.sifive.u.soc"'s instance struct SiFiveUSoCState.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/riscv/sifive_e.h | 2 +-
>   include/hw/riscv/sifive_u.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 25ce7aa9d5..f05644df7c 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -29,7 +29,7 @@
>   
>   typedef struct SiFiveESoCState {
>       /*< private >*/
> -    SysBusDevice parent_obj;
> +    DeviceState parent_obj;
>   
>       /*< public >*/
>       RISCVHartArrayState cpus;
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 16c297ec5f..5f62cf5f85 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -31,7 +31,7 @@
>   
>   typedef struct SiFiveUSoCState {
>       /*< private >*/
> -    SysBusDevice parent_obj;
> +    DeviceState parent_obj;
>   
>       /*< public >*/
>       CPUClusterState e_cluster;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


