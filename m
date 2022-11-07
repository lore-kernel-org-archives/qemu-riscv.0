Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orxo0-00030Y-R4
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 03:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orxnq-0002yi-7e
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 03:48:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orxnm-0006rd-45
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 03:48:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k8so15112837wrh.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BrsZNPdUEiOXz5kOMyQgmWm0LBz2fMMpURsquXo8K1U=;
 b=GvRrP93++pUPRWC9MP23tCQufATFRyt+GrUuh86ehUoyqat96Mg5guHUh9Y2LBsb/W
 /UxwoFH8/x7YSeiQn4PDdyOkVKy5wbCaK4Ok7xhTmbUwgDlvMUu+YgdP1yJYh0YENLWP
 vluf/cm+rdb+4rkCiXQvJi4JYVjidHoJS27v5zlJNod9Eq78Zx6EqXvLXIu5wZ71m0sW
 BKi3n+ViBzzTkN1JR+ehlu01G8aiPXAB33K7xjWxopo8Cr1KolYCJmff/BN0HZbQ5Ltw
 bytfne8GvbFhT4wedVR7rGL8nFBG2q3BKqnFncJVYmdfvs2kSXA+Zty7HVLnHZ7Lt+g0
 T4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrsZNPdUEiOXz5kOMyQgmWm0LBz2fMMpURsquXo8K1U=;
 b=ZFjj20yOmxsmbCTRTp/gNumKR7CXkVmhC7p0He94QQuYo1YR63amCcVMAu+eJFEu17
 1ldjMNNpI4I6hDkH0cqqakKBqI4H46z3oRov0oENYP0HkQDEcJu3fywsn/m1WvG5JcxP
 8ZbMtcYEq21HlF/W04Izc3+tspSaB7/B+BfQBzjPC5r2TjSl8XUmKeUz/if0EWoCnP6/
 0hnib4qU/A8YSB0+hIW12yV87HgKDppUXYXErncPMJ4OLGRZb/XkfgB5tohJ+bpUcOH7
 xhm/RieIF9uGS9sACxn7jkrbDUtlHBVzLbvTqtEQgOuAtgCm+sMZ6Fuypex0OBeGDq3j
 sm2g==
X-Gm-Message-State: ACrzQf1J6/bmSLz6SsgQJmIKAmQngSabbeffJOGCqVn7y8NyLIYWbwjD
 wip0Ue3kk4Gvb2Kglww4sCmZzg==
X-Google-Smtp-Source: AMsMyM73r3WIRN6+QD24QQfPuqr1WgCJHxLIdENaJZpiQE7Lor7GXOTLQaeAIW2H16wxw4GI3h1qEA==
X-Received: by 2002:a5d:60d1:0:b0:237:46c8:1f6d with SMTP id
 x17-20020a5d60d1000000b0023746c81f6dmr15543700wrt.232.1667810885541; 
 Mon, 07 Nov 2022 00:48:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm11606634wms.10.2022.11.07.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 00:48:05 -0800 (PST)
Date: Mon, 7 Nov 2022 09:48:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Mike Maslenkin <mike.maslenkin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221107084803.myuc77xssykljyxv@kamzik>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
 <Y2ibaoOzna0iT7Sa@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2ibaoOzna0iT7Sa@sunil-laptop>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 07 Nov 2022 08:48:30 -0000

On Mon, Nov 07, 2022 at 11:16:00AM +0530, Sunil V L wrote:
> On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> > Hello Sunil!
> > 
> > What about virt_machine_done() function?
> > kernel_entry variable still points to the second flash started from
> > virt_memmap[VIRT_FLASH].size / 2.
> > 
> 
> The base address of the flash has not changed to keep things flexible. So, I
> didn't change this portion of the code to keep the changes minimal.

I think we should change virt_machine_done() to be consistent with
create_fdt_flash() and also add a comment in virt_flash_map() explaining
the base addresses are statically determined from virt_memmap[VIRT_FLASH],
but the sizes are variable and determined in virt_flash_map1().

Thanks,
drew

