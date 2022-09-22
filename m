Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obOtO-0007kj-93
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 12:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOtK-0007gq-8L
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 12:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOtF-0001pv-OD
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 12:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663863448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHOr6zgNQrFanSNVJmTmiv0Gj13eEf6UOZamHQhpJag=;
 b=ZhDno7aoNNVx6HGxfu4f/pVeh0kPKaAhdLSXfw2j1+OHRlBFbVG60guDR+W5SbnhQZoZSV
 Bd/JhLXZFFAESB2pluGA+ORSANe47ydpj6FHWOL7V+rZpgEOOKX6pKN2BYRByck4ThPIGq
 XmQ3eenwA6Z329wpLuZP9YL7KVRWcsI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-1VcvwjP2OKiMwoBaBXtf2Q-1; Thu, 22 Sep 2022 12:17:27 -0400
X-MC-Unique: 1VcvwjP2OKiMwoBaBXtf2Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa15-20020a1709076d0f00b00781d793f51fso1902423ejc.18
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 09:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XHOr6zgNQrFanSNVJmTmiv0Gj13eEf6UOZamHQhpJag=;
 b=noO6Gpey44Cx2ztzYbx7N6H7NHeDxwyQjSxkIAy48HfzkNCeMn+WUX0ifJwqGrFwjn
 dL689kRXYkrYB6RggNciPZ9ZiVwA7MHy+6I922my6J89fg8iHiBJg7Hdpj1260wJAHgD
 5L12mW+PmNzsLVeXDftmakf+qQUH04SrSeYDYHAXG+++ccb4aOn6AGka1TpPsXn8Mm0n
 CP1ATTCEyL5UbTYkw12nEYb2LMpcUY0s3PNf/0JfFoIQPbaQbvyhJG/ZLRnXMbJ8y0FC
 WSzBG9fwFPr0fc1fLpge5QGuY+1LiL46ODRVJ6HM2sB7H7KX+sPRQAooVAAnO9ewhSGJ
 fJMw==
X-Gm-Message-State: ACrzQf1SjRnHfDA5sC4gBALGHPKTOdWT/kw8VHz48sx2f5ej42piQjYg
 unqf7XhsiXpgBXi6wCKG78nOQiVwSHT+MWLXhF/ACDNKgQ5yQYXhUAW9B3OsRfa/cDECnHQ2mGZ
 FMZ7oouALGBgq1R8=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr4171308ede.375.1663863446698; 
 Thu, 22 Sep 2022 09:17:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bbSZHsFa6xWT0QKiyffW6Q1cHDVVnaYMnKBBlb63T8QO/sNQ86prrtK8LjkkBANBHVnswow==
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr4171284ede.375.1663863446454; 
 Thu, 22 Sep 2022 09:17:26 -0700 (PDT)
Received: from [192.168.45.94] ([37.85.29.70])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709063ca200b0076fcde2ff37sm2841057ejh.70.2022.09.22.09.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 09:17:25 -0700 (PDT)
Message-ID: <55a69b23-3bea-0676-478a-d257fc4febf5@redhat.com>
Date: Thu, 22 Sep 2022 18:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Tyler Ng <tkng@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
In-Reply-To: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 16:17:35 -0000

On 22/09/2022 17.58, Tyler Ng wrote:
> This commit adds most of an implementation of the OpenTitan Always-On
> Timer. The documentation for this timer is found here:
> 
> https://docs.opentitan.org/hw/ip/aon_timer/doc/
> 
> Using commit 217a0168ba118503c166a9587819e3811eeb0c0c
> 
> The implementation includes most of the watchdog features; it does not
> implement the wakeup timer.
> 
> An important note: the OpenTitan board uses the sifive_plic. The plic
> will not be able to claim the bark interrupt (159) because the sifive
> plic sets priority[159], but checks priority[158] for the priority, so
> it thinks that the interrupt's priority is 0 (effectively disabled).
...
> diff --git a/tests/qtest/ibex-aon-timer-test.c
> b/tests/qtest/ibex-aon-timer-test.c
> new file mode 100644
> index 0000000000..af33feac39
> --- /dev/null
> +++ b/tests/qtest/ibex-aon-timer-test.c
> @@ -0,0 +1,189 @@
> +/*
> + * Testing the OpenTitan AON Timer
> + *
> + * Copyright (c) 2022 Rivos Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the
> "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.

Could you maybe add a SPDX license identifier at the beginning of the 
comment, so that it's easier to identify the license at a first glance? 
(also in the other new files)

> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +
> +#define AON_BASE_ADDR (0x40470000ul)
> +#define AON_ADDR(addr) (AON_BASE_ADDR + addr)
> +#define AON_WKUP_IRQ 158
> +#define AON_BARK_IRQ 159
> +#define AON_FREQ 200000 /* 200 KHz */
> +#define AON_PERIOD_NS 5000
> +#define NANOS_PER_SECOND 1000000000LL
> +/* Test that reads work, and that the regs get reset to the correct value */
> +static void test_reads(void)
> +{
> +    QTestState *test = qtest_init("-M opentitan");
> +    g_assert(qtest_readl(test, AON_ADDR(0x00)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x04)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x08)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x0c)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x10)) == 1); > +    g_assert(qtest_readl(test, AON_ADDR(0x14)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x18)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x1c)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x20)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x24)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x28)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x2c)) == 0);

The read tests that check for 0 could maybe be simplified with a for-loop 
(or two).

> +    qtest_quit(test);
> +}
> +
> +static void test_writes(void)
> +{
> +    /* Test that writes worked, while the config is unlocked */
> +    QTestState *test = qtest_init("-M opentitan");
> +
> +
> +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> +                     ==, (1 << 19));
> +
> +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> +                     ==, (1 << 20));
> +
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL enable */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> +                     ==, 0x1);
> +
> +    qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN enable */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), ==, 0x0);

I think the above code would be better readable if you'd provide a helper 
function like this:

static void writel_and_assert(QTestState qts, int addr, int val)
{
     qtest_writel(qts, AON_ADDR(addr), val);
     g_assert_cmpuint(qtest_readl(qts, AON_ADDR(addr)), val);
}

> +    /*
> +     * Test configuration lock
> +     * These should not successfully write.
> +     */
> +    qtest_writel(test, AON_ADDR(0x14), 0);
> +    qtest_writel(test, AON_ADDR(0x18), 0);
> +    qtest_writel(test, AON_ADDR(0x1c), 0);
> +
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> +                     ==, 0x1);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> +                     ==, (1 << 19));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> +                     ==, (1 << 20));
> +
> +    /* This should not work, as it's a rw0c reg. */
> +    qtest_writel(test, AON_ADDR(0x10), 1);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),
> +                     ==, 0x0);
> +
> +    qtest_quit(test);
> +}
> +
> +
> +/* Test whether the watchdog timer works during normal operation */
> +static void test_operation(void)
> +{
> +    QTestState *test = qtest_init("-M opentitan");
> +
> +    /* Set up interrupts */
> +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> +
> +    /* Setup timer */
> +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> +
> +    /* Run simulation, without enabling timer: */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 30);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, 0); /* checks if WDOG_COUNT gets updated */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0); /* checks if INTR_STATE is clear */
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Enable the timer, and test if the count is updated correctly */
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, 0);
> +    qtest_clock_step(test, NANOS_PER_SECOND);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, AON_FREQ);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0);
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Disable the timer, and test if the count freezes */
> +    qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CTRL = 0 */
> +    qtest_clock_step(test, NANOS_PER_SECOND);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, AON_FREQ);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0);
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Enable the timer, and run to bark */
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     >=, (1 << 19));
> +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, (1 << 1));
> +
> +    /* Disable IRQ by writing to INTR_STATE. Should bark next cycle */
> +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, (1 << 1));
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +    qtest_clock_step(test, AON_PERIOD_NS);
> +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> +    /*
> +     * Disable IRQ again, this time by setting WDOG_COUNT = 0 (pet) and
> +     * writing to INTR_STATE.
> +     */
> +    qtest_writel(test, AON_ADDR(0x20), 0);
> +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Ensure no bite occurs, after resetting the timer. */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);
> +    QDict *resp = qtest_qmp(test, "{'execute':'query-status'}");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* Allow test to run to bite. */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);
> +    QDict *data = qdict_get_qdict(qtest_qmp_eventwait_ref(test, "WATCHDOG"),
> +                                  "data");
> +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "reset");
> +    qobject_unref(data);
> +    qtest_quit(test);
> +}
> +
> +
> +

Please avoid multiple blank lines (it's not very common in QEMU, I think).

> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/ibex-aon-timer/reads", test_reads);
> +    qtest_add_func("/ibex-aon-timer/writes", test_writes);
> +    qtest_add_func("/ibex-aon-timer/op", test_operation);
> +    return g_test_run();
> +}

  Thomas


